//
//  LocationModel.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/3.
//

import Foundation
import CoreLocation

struct LocationModel: Identifiable, Codable {
  var id: String
  var name: String
  var image: String
  // Double
  var latitude: Double
  var longitude: Double
  // 计算属性
  var location: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude);
  }
}
