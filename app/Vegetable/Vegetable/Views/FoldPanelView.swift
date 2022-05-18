//
//  FoldPanelView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/18.
//

import SwiftUI

struct FoldPanelView: View {
  var vegetable: VegetableModel;
  init(_ vegetable: VegetableModel) {
    self.vegetable = vegetable;
  }
  let categories: [String] = ["门", "纲", "亚纲", "目", "科", "属", "族", "种", "分布区域"];
  var body: some View {
    GroupBox {
      DisclosureGroup("蔬菜分类") {
        ForEach(0..<categories.count, id: \.self) {index in
          Divider().padding(.vertical, 2);
          HStack() {
            HStack() {
              Image(systemName: "info.circle")
              Text("\(categories[index]):")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(vegetable.colors[1]);
            }
            // .font(.system(.body).bold())
            .foregroundColor(vegetable.colors[0])
            Spacer(minLength: 65)
            Text("\(vegetable.categories[index])")
              .multilineTextAlignment(.trailing);
          }
        }
      }
    }
  }
}

//struct FoldPanelView_Previews: PreviewProvider {
//  static var previews: some View {
//    FoldPanelView(vegetable: VegetableData[0])
//      .preferredColorScheme(.dark)
//      .previewLayout(.fixed(width: 375, height: 480))
//      .padding()
//  }
//}
