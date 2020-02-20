//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by 郑嘉浚 on 2020/1/17.
//  Copyright © 2020 郑嘉浚. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList { WatchLandmarkDetail(landmark: $0) }
            .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
