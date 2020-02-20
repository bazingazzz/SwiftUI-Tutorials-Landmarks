//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by 郑嘉浚 on 2020/1/15.
//  Copyright © 2020 郑嘉浚. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    
    var profile: Profile
    
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    
    var body: some View {
        VStack(alignment: .center) {
            List {
                Text(profile.username)
                    .fontWeight(.heavy)
                    .bold()
                    .font(.title)
                
                HStack {
                    Text("Notifications:")
                        .font(.headline)
                        .bold()
                    Text("\(self.profile.prefersNotifications ? "On": "Off" )")
                        .font(.body)
                    
                }
                

                HStack {
                    Text("Seasonal Photos:")
                        .font(.headline)
                        .bold()
                    Text("\(self.profile.seasonalPhoto.rawValue)")
                    .font(.body)
                }
                
                HStack {
                    Text("Goal Date:")
                        .font(.headline)
                        .bold()
                    Text("\(self.profile.goalDate, formatter: Self.goalFormat)")
                    .font(.body)
                }
                
                VStack(alignment: .leading) {
                    Text("Completed Badges:")
                        .font(.headline)
                    ScrollView {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                    }
                    .frame(height: 140)
                }
                
                VStack (alignment: .leading) {
                    Text("Recent Hikes:")
                        .font(.headline)
                        .bold()
//                    HikeView(hike: hikeData[0])
//                        .padding(.all)
                }
            }
            .disabled(true)
            .frame(height: 400)
            .padding(.bottom, 0.0)
            
            HikeView(hike: hikeData[0])
            .offset(x: 0, y: 10)
            .padding(.horizontal)

                
//            VStack(alignment: .center){
//                Text("Recent Hikes:")
//                    .font(.headline)
//                    .bold()
//                    .padding()
//                HikeView(hike: hikeData[0])
//            }
//            .offset(x: 0, y: 0)
//            .padding(.vertical, 0.0)
//            .padding(.horizontal)
//
        }
    }
    
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
