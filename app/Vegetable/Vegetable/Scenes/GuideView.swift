//
//  GuideView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

struct GuideView: View {
  var cards: [VegetableModel] = VegetableData;
  var body: some View {
    TabView {
      /*
      ForEach(cards) {card in
        GuideCardView(card)
      }
      ForEach(0..<5) {card in
       GuideCardView(card)
      }
      */
      // 指定范围
      ForEach(cards[0..<5]) {card in
        GuideCardView(card)
      }
    }
    .tabViewStyle(PageTabViewStyle())
    .padding(.vertical, 20)
  }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
      GuideView(cards: VegetableData)
    }
}
