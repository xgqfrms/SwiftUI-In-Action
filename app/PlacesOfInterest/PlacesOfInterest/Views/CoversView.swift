//
//  CoversView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct CoversView: View {
  // 分页效果
  private let pagination = PageTabViewStyle();
  var body: some View {
    TabView {
      ForEach(0..<5) {item in
        Image("封面-万里长城")
          .resizable()
          .scaledToFit()
      }
      .tabViewStyle(pagination)
    }
  }
}

struct CoversView_Previews: PreviewProvider {
  static var previews: some View {
    CoversView()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
