//
//  VegetableApp.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

@main
struct VegetableApp: App {
  @AppStorage("isFirst") var isFirst: Bool = true;
  var body: some Scene {
    WindowGroup {
      if(isFirst) {
        GuideView()
      } else {
        ContentView()
      }
    }
  }
}
