//
//  ContentView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

struct ContentView: View {
  var vegetables: [VegetableModel] = VegetableData;
  var body: some View {
    // 导航视图 NavigationView / NavigationLink
    NavigationView {
      // ScrollView 二次封装 ？List
      List {
        // shuffled 洗牌随机算法
        ForEach(vegetables.shuffled()) {vegetable in
          NavigationLink(destination: VegetableDetailView(vegetable)) {
            ListRowView(vegetable)
              .padding(.vertical, 4)
          }
        }
      }
      .navigationTitle("蔬菜列表")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
