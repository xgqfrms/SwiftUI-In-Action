//
//  ListModel.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

// Immutable Struct
struct ListModel: Identifiable {
  // let id: String = UUID().uuidString;
  let id: String
  let text: String
  let completed: Bool
  init (id: String = UUID().uuidString, text: String, completed: Bool) {
    self.id = id;
    self.text = text;
    self.completed = completed;
  }
  // id 复用
  func toogleItemCompleted() -> ListModel {
    return ListModel(
      id: id,
      text: text,
      // toogle
      completed: !completed
    );
  }
}


// mutable Struct ❌
//struct MutableListModel: Identifiable {
//  // var id: UUID = UUID();
//  var id: String = UUID().uuidString;
//  var text: String
//  var completed: Bool
//}
