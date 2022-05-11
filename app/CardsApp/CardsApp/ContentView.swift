//
//  ContentView.swift
//  CardsApp
//
//  Created by 夏凌晨 on 2022/5/10.
//

import SwiftUI

let cards: [Card] = CardData;
// 2. UI 入口文件
struct ContentView: View {
    var body: some View {
//      VStack {
//        CardView();
//        Text("Hello, world!").padding();
//      }
      // CardView();
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .center, spacing: 20) {
          ForEach(cards) {item in
            CardView(card: item);
            // Argument passed to call that takes no arguments
          }
        }
        .padding(20)
      }
    }
}

// preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // ContentView()
        ContentView()
        .previewDevice("iPhone 12 Pro");
        // 指定预览机型
    }
}
