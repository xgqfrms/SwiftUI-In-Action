//
//  DeveloperModel.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/19.
//

import SwiftUI

struct DeveloperModel: Identifiable {
  var id: UUID = UUID();
  var key: String;
  var value: String;
  // 可选属性
  var isURL: Bool?;
  // var linkName: String?;
  // var linkURL: String?;
}

