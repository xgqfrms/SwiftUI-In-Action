//
//  TodoListApp.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

@main
struct TodoListApp: App {
  // mock data
  let listData: [ListModel] = ListData;
  var body: some Scene {
    WindowGroup {
      // ListView(listData);
      ListView();
      // EditButtonBugView();
    }
  }
}
