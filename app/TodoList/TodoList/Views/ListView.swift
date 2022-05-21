//
//  ListView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct ListView: View {
  // var items: [ListModel];
  // Cannot use mutating member on immutable value: 'self' is immutable
  /*
  @State var items: [ListModel];
  init(_ list: [ListModel]) {
    self.items = list;
  }
  */
  @EnvironmentObject var listViewModel: ListViewModel;
  var body: some View {
    // 导航视图
    NavigationView {
      List {
        ForEach(listViewModel.items) {item in
          RowView(item)
//            .onTapGesture {
//              withAnimation(.linear) {
//                listViewModel.toggleItem(item: item)
//              }
//            }
        }
        .onDelete(perform: listViewModel.deleteItem)
        .onMove(perform: listViewModel.moveItem)
        /*
        ForEach(items) {item in
          RowView(item)
        }
        .onDelete {
          items.remove(atOffsets: $0)
        }
        .onMove {
          items.move(fromOffsets: $0, toOffset: $1)
        }
        */
      }
      .listStyle(PlainListStyle())
      .navigationTitle("待办清单 📝")
      // .navigationTitle("Todo List 📝")
      // SwiftUI 国际化 ? language
      .navigationBarItems(
        leading: EditButton(),
        trailing: NavigationLink("添加", destination: AddItemView())
        // trailing: NavigationLink("Add", destination: AddItemView())
      )
//      .toolbar {
//        ToolbarItem(placement: .navigationBarLeading) {
//          HStack {
//            EditButton()
//              .foregroundColor(.pink)
//            Image(systemName: "pencil.circle")
//          }
//        }
//        ToolbarItem(placement: .navigationBarTrailing) {
//          HStack {
//            NavigationLink("Add", destination: AddItemView())
//            Image(systemName: "gear.circle")
//          }
//        }
//      }
    }
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
    // ListView(ListData)
  }
}

