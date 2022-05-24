//
//  TodoListApp.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

@main
struct TodoListApp: App {
  // 实例化 ViewModel
  @StateObject var listViewModel: ListViewModel = ListViewModel();
  var body: some Scene {
    WindowGroup {
      TabView {
        CustomEditView()
          .tabItem({
            Image(systemName: "house.circle")
            Text("Home")
          })
          .navigationViewStyle(StackNavigationViewStyle())
          .environmentObject(listViewModel)
        //
        SettingView()
          .tabItem({
            Image(systemName: "gear")
            Text("Setting")
          })
      }
//      CustomEditView()
//        // 适配 iPad 宽屏幕 ✅
//        .navigationViewStyle(StackNavigationViewStyle())
//        .environmentObject(listViewModel)
//        // .environment(\.locale, .init(identifier: "en"));
//        // .environment(\.locale, .init(identifier: "en-US"));
//        // .environment(\.locale, .init(identifier: "zh-Hans"));
    }
  }
}
