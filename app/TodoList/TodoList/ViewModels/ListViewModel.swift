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
  func deleteItem (index: IndexSet) {
    items.remove(atOffsets: index);
  }
  func moveItem (fromIndex: IndexSet, toIndex: Int) {
    items.move(fromOffsets: fromIndex, toOffset: toIndex);
  }
  func addItem (_ text: String) {
    let listModel = ListModel(
      text: text,
      completed: false
    );
    items.append(listModel);
  }
  func toggleItem (index: IndexSet) {
//    let item = items.formIndex(index);
//    item.completed = !item.completed;
//    items.replace(index, item);
  }
}

