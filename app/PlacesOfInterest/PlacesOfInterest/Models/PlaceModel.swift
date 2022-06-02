//
//  PlaceModel.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import Foundation


struct PlaceModel: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let message: [String]
}
