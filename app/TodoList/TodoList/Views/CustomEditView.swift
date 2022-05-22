//
//  CustomEditView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/22.
//

import SwiftUI

struct CustomEditView: View {
  @EnvironmentObject var listViewModel: ListViewModel;
  @State private var editMode: EditMode = EditMode.inactive;
  // @Environment(\.editMode) private var editMode;
  var body: some View {
    // 导航视图
    NavigationView {
      ZStack {
        if (listViewModel.items.isEmpty) {
          // EmptyView()
          NoItemsView()
        } else {
          List {
            ForEach(listViewModel.items) {item in
              RowView(item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
          }
        }
      }
      .environment(\.editMode, $editMode)
      .listStyle(PlainListStyle())
      .navigationTitle(String(localized: "TodoList"))
      // .navigationTitle(NSLocalizedString("TodoList", comment: "todo list comment!"))
      // .navigationTitle("待办清单 📝")
      // .navigationTitle("Todo List 📝")
      // SwiftUI 国际化 ? language
      // NSLocalizedString(<#T##key: String##String#>, comment: <#T##String#>)
      // String(localized: <#T##String.LocalizationValue#>)
      .navigationBarItems(
        // leading: EditButton(),
        // leading: editMode.isEditing == .active ? Text("编辑") : Text("完成"),
        leading: Button(editMode.isEditing ? "完成": "编辑") {
          switch editMode {
            case .active:
              self.editMode = .inactive
            case .inactive:
              self.editMode = .active
            default:
              break
          }
        },
        trailing: NavigationLink("添加", destination: AddItemView())
        // trailing: NavigationLink("Add", destination: AddItemView())
      )
//      .toolbar {
//        Button(editMode.isEditing ? "完成": "编辑") {
//          switch editMode {
//            case .active:
//              self.editMode = .inactive
//            case .inactive:
//              self.editMode = .active
//            default:
//              break
//          }
//        }
//      }
    }
  }
}

struct CustomEditView_Previews: PreviewProvider {
  static var previews: some View {
    CustomEditView()
  }
}
