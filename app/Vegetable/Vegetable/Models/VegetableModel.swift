//
//  VegetableModel.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

struct VegetableModel: Identifiable {
  var id:UUID = UUID();
  var title: String;
  var headline: String;
  var image: String;
  var colors: [Color];
  var desc: String;
  var categories: [String];
}
