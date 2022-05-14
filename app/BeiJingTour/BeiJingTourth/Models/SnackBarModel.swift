//
//  SnackBarModel.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/14.
//

import SwiftUI

struct SnackBarModel: Identifiable {
  var id = UUID();
  var title: String;
  var headline: String;
  var image: String;
  var rating: Int;
  var serves: Int;
  var preparation: Int;
  var hot: Int;
  var intros: [String];
  var methods: [String];
}
