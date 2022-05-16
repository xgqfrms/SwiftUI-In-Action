//
//  HutongModel.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/16.
//

import SwiftUI

struct HutongModel: Identifiable {
  var id = UUID();
  var image: String;
  var title: String;
  var ranking: String;
  var desc: String;
  var times: String;
  var feature: String;
}
