//
//  ListRowView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

struct ListRowView: View {
  var vegetable: VegetableModel;
  init(_ vegetable: VegetableModel) {
    self.vegetable = vegetable;
  }
  let rgbaColor: Color = Color(red: 0, green: 0, blue: 0, opacity: 0.3);
  func getColors (_ colors: [Color]) -> LinearGradient {
    return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom);
  }
  var body: some View {
    HStack {
      Image(vegetable.image)
        // 原始像素图片
        .renderingMode(.original)
        // 非透明部分图片，使用系统颜色（light/ dark）
        .renderingMode(.template)
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80, alignment: .center)
        .shadow(color: rgbaColor, radius: 3, x: 2, y: 2)
        .background(getColors(vegetable.colors))
        .cornerRadius(8)
      VStack(alignment: .leading, spacing: 5) {
        Text(vegetable.title)
          .font(.title2)
          .fontWeight(.bold)
        Text(vegetable.headline)
          .font(.caption)
          // secondary === primary + 透明度
          .foregroundColor(.secondary)
      }
      .frame(height: 80)
      .padding()
    }
  }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
      ListRowView(VegetableData[0])
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
