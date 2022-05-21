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
  // mock data
  // let listData: [ListModel] = ListData;
  var body: some Scene {
    WindowGroup {
       ListView()
        .environmentObject(listViewModel);
      // ListView(listData);
    }
  }
}
