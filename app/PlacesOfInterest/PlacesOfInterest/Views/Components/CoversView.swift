//
//  CoversView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct CoversView: View {
  let covers: [CoverModel] = Bundle.main.decode("covers.json");
  // 分页效果
  private let pagination = PageTabViewStyle();
  var body: some View {
    TabView {
      ForEach(covers) {cover in
        Image(cover.name)
          .resizable()
          .scaledToFill()
      }
    }
    // TabView
    .tabViewStyle(pagination)
  }
}

struct CoversView_Previews: PreviewProvider {
  static var previews: some View {
    CoversView()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
