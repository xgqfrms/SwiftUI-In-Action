//
//  VegetableDetailView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/18.
//

import SwiftUI

struct VegetableDetailView: View {
  var vegetable: VegetableModel;
  init(_ vegetable: VegetableModel) {
    self.vegetable = vegetable;
  }
  private let rgbaColor: Color = Color(red: 0, green: 0, blue: 0, opacity: 0.15);
  private func getGradientColors (_ colors: [Color]) -> LinearGradient {
    return LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing);
  }
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          // 渐变色背景图片
          VegetableHeaderView(vegetable)
          // 文字内容组
          VStack(alignment: .leading, spacing: 20) {
            Text(vegetable.title)
              .font(.largeTitle)
              .fontWeight(.heavy)
              .foregroundColor(vegetable.colors[1])
            // Spacer()
            Text(vegetable.headline)
              .font(.headline)
              .multilineTextAlignment(.leading)
            // 折叠面板
            Text("了解更多: \(vegetable.title)")
              .fontWeight(.bold)
              .foregroundColor(vegetable.colors[1])
            //
            Text(vegetable.desc)
              .multilineTextAlignment(.leading)
            // iframe 外链
            OutLinkView(vegetable)
          }
          .padding(.horizontal, 20)
          .frame(maxWidth: 640, alignment: .center)
        }
        // 导航栏标题
        .navigationBarTitle(vegetable.title, displayMode: .inline)
        // 隐藏导航栏空白
        .navigationBarHidden(true)
      }
      .edgesIgnoringSafeArea(.top)
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    VegetableDetailView(VegetableData[0])
  }
}
