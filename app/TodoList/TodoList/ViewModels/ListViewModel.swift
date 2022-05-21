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
  func toggleItem (item: ListModel) {
      if let index = items.firstIndex(where: { $0.id == item.id }) {
        // 整体替换 item
        items[index] = item.toogleItemCompleted();
//        items[index] = ListModel(
//          text: item.text,
//          completed: !item.completed
//        );
      }
//    guard let index = items.firstIndex(where: { $0.id == item.id }) else {
//      // 整体替换 item
//      items[index] = ListModel(
//        text: item.text,
//        completed: !item.completed
//      );
//      // Cannot convert value of type '(UnsafePointer<CChar>?, Int32) -> UnsafeMutablePointer<CChar>?' (aka '(Optional<UnsafePointer<Int8>>, Int32) -> Optional<UnsafeMutablePointer<Int8>>') to expected argument type 'Int'
//    }
    //    item.completed = !item.completed;
    //    items.replace(index, item);
//    if let index = items.firstIndex {(obj) -> Bool in
//      obj.id == item.id
//    } {
//      // do something
//    }

//    if let index = items.firstIndex(where: {(obj) -> Bool in
//      obj.id == item.id
//    }) {
//      // do something
//    }

//    if items.firstIndex(where: {(obj) -> Bool in
//      obj.id == item.id
//    }) != nil {
//      // do something
//    }

//    if let index = items.firstIndex(where: { $0.id == item.id; }) {
//      //
//    }
  }
}

