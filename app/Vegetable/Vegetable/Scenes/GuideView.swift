//
//  GuideView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

struct GuideView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text("引导场景视图")
      StartButtonView();
    }
  }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
