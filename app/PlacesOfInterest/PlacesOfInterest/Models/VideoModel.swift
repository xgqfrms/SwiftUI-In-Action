//
//  VideoModel.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/3.
//

import Foundation

struct VideoModel: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  // 计算属性
  var thumbnail: String {
    return "视频封面-\(name)";
  }
}
