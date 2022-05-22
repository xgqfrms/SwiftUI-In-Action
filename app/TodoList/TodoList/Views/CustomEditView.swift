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
  var body: some View {
    // 导航视图
    NavigationView {
      ZStack {
        if (listViewModel.items.isEmpty) {
          // EmptyView()
          // 自定义 empty view
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
      // SwiftUI 国际化
      // NSLocalizedString(<#T##key: String##String#>, comment: <#T##String#>) ✅
      // .navigationTitle(NSLocalizedString("TodoList", comment: "todo list comment!"))
      // String(localized: <#T##String.LocalizationValue#>) ✅
      .navigationTitle(String(localized: "TodoList"))
      .navigationBarItems(
        // leading: EditButton(),
        // 自定义 edit button
        leading: Button(editMode.isEditing ? "Done": "Edit") {
          switch editMode {
            case .active:
              self.editMode = .inactive
            case .inactive:
              self.editMode = .active
            default:
              break
          }
        },
        trailing: NavigationLink("Add", destination: AddItemView())
      )
    }
  }
}

struct CustomEditView_Previews: PreviewProvider {
  static var previews: some View {
    CustomEditView()
  }
}
