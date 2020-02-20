//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 郑嘉浚 on 2020/1/15.
//  Copyright © 2020 郑嘉浚. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold()
                    .font(.headline)
                Divider()
                TextField("Username", text: $profile.username)
            }
            .padding(.vertical)
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
                .bold()
                .font(.headline)
            }
            .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo")
                    .bold()
                    .font(.headline)
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 20) {
                         Text("Goal Date")
                            .bold()
                            .font(.headline)
                         DatePicker(
                             "📅",
                             selection: $profile.goalDate,
                             in: dateRange,
                             displayedComponents: .date)
            }
            .padding(.vertical)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
