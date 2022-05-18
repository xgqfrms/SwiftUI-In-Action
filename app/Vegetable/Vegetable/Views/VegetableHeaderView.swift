//
//  VegetableHeaderView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/18.
//

import SwiftUI

struct VegetableHeaderView: View {
  var vegetable: VegetableModel;
  init(_ vegetable: VegetableModel) {
    self.vegetable = vegetable;
  }
  @State private var animate: Bool = true;
  private let rgbaColor: Color = Color(red: 0, green: 0, blue: 0, opacity: 0.15);
  private func getGradientColors (_ colors: [Color]) -> LinearGradient {
    return LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing);
  }
  var body: some View {
    ZStack {
      getGradientColors(vegetable.colors);
      Image(vegetable.image)
        .resizable()
        .scaledToFit()
        .shadow(color: rgbaColor, radius: 8, x: 6, y: 8)
        .padding(.vertical, 20)
    }
    .frame(height: 440)
    .onAppear() {
      withAnimation(.easeInOut(duration: 0.5)) {
        animate = false;
      }
    }
  }
}

struct VegetableHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    VegetableHeaderView(VegetableData[0])
      .previewLayout(.fixed(width: 375, height: 440))
  }
}
