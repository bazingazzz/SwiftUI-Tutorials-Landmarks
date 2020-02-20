/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    //id
    var id: Int
    //name
    var name: String
    //imagename
    fileprivate var imageName: String
    //坐标
    fileprivate var coordinates: Coordinates
    //城市
//    var city: String
    //州
    var state: String
    //park
    var park: String
    //分类
    var category: Category
    //用户是否喜爱
    var isFavorite: Bool
    //是否有特性
    var isFeatured: Bool
    
    //坐标
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    var featureImage: Image? {
        guard isFeatured else { return nil }
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)_feature"),
            scale: 2,
            label: Text(verbatim: name))
    }
    
    //种类枚举
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
