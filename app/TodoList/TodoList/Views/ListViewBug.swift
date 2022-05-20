//
//  ListViewBug.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct ListViewBug: View {
  //  var items: [ListModel];
  //  init(_ list: [ListModel]) {
  //    self.items = list;
  //  }
  @State var items: [String] = [
    "abc",
    "xyz",
    "ufo",
    "wtf"
  ];
  var body: some View {
    // 导航视图
    // NavigationView {}
    List {
      //      ForEach(items) {item in
      //        RowView(item)
      //      }
      ForEach(items, id: \.self) {item in
        RowView(item: item)
      }
    }
    .listStyle(PlainListStyle())
    .navigationTitle("Todo List")
    .toolbar {
      EditButton()
      //      ToolbarItemGroup {
      //        EditButton()
      //        NavigationLink("Add", destination: AddItemView())
      //      }
      //      ToolbarItem(placement: .navigationBarLeading) {
      //        Image(systemName: "pencil.circle")
      //        EditButton()
      //      }
      //      ToolbarItem(placement: .navigationBarTrailing) {
      //        Image(systemName: "gear.circle")
      //        // NavigationLink("Add", destination: AddItemView())
      //      }
    }
    //    .navigationBarItems(
    //      // leading: EditButton(),
    //      leading: Button(
    //        action: {
    //          print("open");
    //        },
    //        label: {
    //          // Image(systemName: "slider.horizontal.3")
    //          Image(systemName: "button")
    //            .foregroundColor(.red)
    //        }
    //      ),
    //      trailing: Button(
    //        action: {
    //          print("open");
    //        },
    //        label: {
    //          // Image(systemName: "slider.horizontal.3")
    //          Image(systemName: "gear.circle")
    //            .foregroundColor(.green)
    //        }
    //      )
    //    )
    //    .navigationBarItems(
    //      leading: EditButton(),
    //      trailing: NavigationLink("Add", destination: AddItemView())
    //    )
    //    .toolbar { EditButton() }
    //    .toolbar {
    //      ToolbarItem(placement: .navigationBarTrailing) {
    //        EditButton()
    //      }
    //      ToolbarItem(placement: .navigationBarLeading) {
    //        NavigationLink("Add", destination: AddItemView())
    //      }
    //    }
    //      VStack(alignment: .leading, spacing: 10) {
    //        ForEach(items) {item in
    //          RowView(item)
    //        }
    //      }
    //      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
  }
}

struct ListViewBug_Previews: PreviewProvider {
    static var previews: some View {
        ListViewBug()
    }
}
