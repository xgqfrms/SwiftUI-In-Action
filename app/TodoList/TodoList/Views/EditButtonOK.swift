//
//  EditButtonOK.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct EditButtonOK: View {
  //  var items: [ListModel];
  //  init(_ list: [ListModel]) {
  //    self.items = list;
  //  }
  @State private var items: [String] = [
    "abc",
    "xyz",
    "ufo",
    "wtf"
  ];
  var body: some View {
    // 导航视图
    NavigationView {
      List {
        ForEach(items, id: \.self) {item in
          RowView(item: item)
        }
        .onDelete {
          items.remove(atOffsets: $0)
        }
        .onMove {
          items.move(fromOffsets: $0, toOffset: $1)
        }
      }
      .listStyle(PlainListStyle())
      .navigationTitle("Todo List")
      //      .toolbar {
      //        EditButton()
      //          .foregroundColor(.blue)
      //      }
      .toolbar {
        //        ToolbarItemGroup {
        //          EditButton()
        //            .foregroundColor(.green)
        //          NavigationLink("Add", destination: AddItemView())
        //        }
        ToolbarItem(placement: .navigationBarLeading) {
          HStack {
            EditButton()
              .foregroundColor(.pink)
            Image(systemName: "pencil.circle")
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Image(systemName: "gear.circle")
          // NavigationLink("Add", destination: AddItemView())
        }
      }
    }
  }
}

struct EditButtonOK_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonOK()
    }
}
