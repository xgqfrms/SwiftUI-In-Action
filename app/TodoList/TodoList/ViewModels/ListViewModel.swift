//
//  ListViewModel.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import Foundation

// ViewModel
class ListViewModel: ObservableObject {
  let uniqueForKey: String = "list_items_for_key";
  // @Published var items: [ListModel] = [];
  @Published var items: [ListModel] = [] {
    // 拦截 setter,
    didSet {
      saveJSON();
    }
  }
  init() {
    // getItems();
    initData();
  }
  func initData () -> Void {
    // guard 多个判断条件可以合并，简写
    guard
      let json = UserDefaults.standard.data(forKey: uniqueForKey),
      let list = try? JSONDecoder().decode([ListModel].self, from: json)
    else {
      // do else
      return;
    }
    // do if, 避免多层 if 出现嵌套问题（js 回调地狱）
    self.items = list;
  }
  func getJSON () -> Any {
    // guard 多个判断条件可以合并，简写
    guard
      let data = UserDefaults.standard.data(forKey: uniqueForKey),
      let json = try? JSONDecoder().decode([ListModel].self, from: data)
    else {
      // do else
      return [ListModel]().self;
    }
    // do if, 避免多层 if 出现嵌套问题（js 回调地狱）
//    guard let data = UserDefaults.standard.data(forKey: uniqueForKey) else {
//      return [ListModel]().self;
//    }
//    guard let json = try? JSONDecoder().decode([ListModel].self, from: data) else {
//      return [ListModel]().self;
//    }
    // Initialization of immutable value 'json' was never used; consider replacing with assignment to '_' or removing it
    // _ = try? JSONDecoder().decode([ListModel].self, from: data);
    return json;
  }
  func saveJSON () {
    if let json = try? JSONEncoder().encode(items) {
      UserDefaults.standard.set(json, forKey: uniqueForKey);
    }
  }
  func getItems() {
    // let listData: [ListModel] = ListData;
    let listData: [ListModel] = getJSON() as! [ListModel];
    items.append(contentsOf: listData);
  }
  // 封装 utils function
  func deleteItem (index: IndexSet) {
    items.remove(atOffsets: index);
    // saveJSON();
  }
  func moveItem (fromIndex: IndexSet, toIndex: Int) {
    items.move(fromOffsets: fromIndex, toOffset: toIndex);
    // saveJSON();
  }
  func addItem (_ text: String) {
    let listModel = ListModel(
      text: text,
      completed: false
    );
    items.append(listModel);
    // saveJSON();
  }
  func toggleItem (item: ListModel) {
      if let index = items.firstIndex(where: { $0.id == item.id }) {
        // 整体替换 item
        items[index] = item.toogleItemCompleted();
        /*
        items[index] = ListModel(
          text: item.text,
          completed: !item.completed
        );
         */
        // saveJSON();
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

