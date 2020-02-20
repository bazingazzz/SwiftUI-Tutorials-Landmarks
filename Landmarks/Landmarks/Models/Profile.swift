/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores user profile data.
*/

import Foundation

//用户文档
struct Profile {
    //用户名
    var username: String
    //是否需要推送
    var prefersNotifications: Bool
    //季节照片
    var seasonalPhoto: Season
    //目标日期
    var goalDate: Date
    
    static let `default` = Self(username: "Bruce", prefersNotifications: true, seasonalPhoto: .winter)
    
    //初始化函数
    init(username: String, prefersNotifications: Bool = true, seasonalPhoto: Season = .winter) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    //枚举季节
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
