//
//  ListModel.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct ListModel: Identifiable {
  // var id: UUID = UUID();
  var id: String = UUID().uuidString;
  var text: String
  var completed: Bool
}
