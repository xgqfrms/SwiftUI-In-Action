//
//  ListViewModel.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import Foundation

// ViewModel
class ListViewModel: ObservableObject {
  @Published var items: [ListModel] = [];
  init() {
    getItems();
  }
  func getItems() {
    let listData: [ListModel] = ListData;
    items.append(contentsOf: listData);
  }
  // 封装 utils function
  /*
  func deleteItem (indexSet: IndexSet) {
    items.remove(atOffsets: indexSet);
  }
  func moveItem (from: IndexSet, to: Int) {
    items.move(fromOffsets: from, toOffset: to);
  }
   */
  func deleteItem (index: IndexSet) {
    items.remove(atOffsets: index);
  }
  func moveItem (fromIndex: IndexSet, toIndex: Int) {
    items.move(fromOffsets: fromIndex, toOffset: toIndex);
  }
}

