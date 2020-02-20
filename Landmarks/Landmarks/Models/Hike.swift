/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for a hike.
*/

import SwiftUI

struct Hike: Codable, Hashable, Identifiable {
    //名字
    var name: String
    //id
    var id: Int
    //距离
    var distance: Double
    //难度
    var difficulty: Int
    //景点
    var observations: [Observation]

    //长度转换
    static var formatter = LengthFormatter()
    
    //转化距离从double到tstring
    var distanceText: String {
        return Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    //景点
    struct Observation: Codable, Hashable {
        //从开始的距离
        var distanceFromStart: Double
        //海拔
        var elevation: Range<Double>
        //地点
        var pace: Range<Double>
        //心率
        var heartRate: Range<Double>
    }
}
