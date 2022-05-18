//
//  ContentView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

struct ContentView: View {
  var vegetables: [VegetableModel] = VegetableData;
  @State private var showSettings: Bool = false;
  var body: some View {
    // 导航视图 NavigationView / NavigationLink
    NavigationView {
      // ScrollView 二次封装 === List ???
      List {
        // shuffled 洗牌随机算法
        ForEach(vegetables.shuffled()) {vegetable in
          NavigationLink(destination: VegetableDetailView(vegetable)) {
            ListRowView(vegetable)
              .padding(.vertical, 4)
          }
        }
      }
      // 导航栏标题
      .navigationTitle("蔬菜列表")
      // 导航栏操作
      .navigationBarItems(trailing: Button(
        action: {
          print("open");
          showSettings = true;
        },
        label: {
          // Image(systemName: "slider.horizontal.3")
          Image(systemName: "gear.circle")
            .foregroundColor(.green)
        }
      ))
      // 抽屉弹层
      .sheet(isPresented: $showSettings) {
        SettingsView();
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
