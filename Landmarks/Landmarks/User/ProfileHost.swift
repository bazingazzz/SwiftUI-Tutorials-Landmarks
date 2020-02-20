//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 郑嘉浚 on 2020/1/15.
//  Copyright © 2020 郑嘉浚. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var editmove: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge:.trailing)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


extension AnyTransition {
    static var cancelmove: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge:.leading)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ProfileHost: View {
    @State var draftProfile = Profile.default
    @EnvironmentObject var userData: UserData
    @Environment(\.editMode) var mode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                            self.draftProfile = self.userData.profile
                            withAnimation(.easeInOut){
                                self.mode?.animation().wrappedValue = .inactive
                            }
                    }
                    .transition(.cancelmove)
                }
                
                Spacer()
                withAnimation(.easeInOut) {
                    EditButton()
                }

            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            }
            else {
                ProfileEditor(profile: $draftProfile)
                    .transition(.editmove)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(UserData())
    }
}
