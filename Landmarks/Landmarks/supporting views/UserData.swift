//
//  UserData.swift
//  Landmarks
//
//  Created by 郑嘉浚 on 2020/1/10.
//  Copyright © 2020 郑嘉浚. All rights reserved.
//

import Foundation

import SwiftUI

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
