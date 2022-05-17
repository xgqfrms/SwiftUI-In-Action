//
//  StartButtonView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

struct StartButtonView: View {
  // 可选变量
  @AppStorage("isFirst") var isFirst: Bool?;
  var body: some View {
    /*
    Button(action: {
      print("关闭引导");
      isFirst = false;
    }, label: {
      HStack(spacing: 8) {
        Text("关闭引导");
        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(Capsule().strokeBorder(.white, lineWidth: 1.25))
    }).accentColor(.white); ❌
    */
    Button(action: {
      print("关闭引导");
      isFirst = false;
    }) {
      HStack(spacing: 8) {
        Text("关闭引导")
        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      }
      // .foregroundColor(.green)
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(Capsule().strokeBorder(.white, lineWidth: 1.25))
    }.accentColor(.white);
  }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
      StartButtonView()
        .previewLayout(.sizeThatFits)
    }
}
