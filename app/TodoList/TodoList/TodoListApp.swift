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
      CustomEditView()
        .environmentObject(listViewModel)
        // .environment(\.locale, .init(identifier: "en"));
        // .environment(\.locale, .init(identifier: "en-US"));
        // .environment(\.locale, .init(identifier: "zh-Hans"));
    }
  }
}
