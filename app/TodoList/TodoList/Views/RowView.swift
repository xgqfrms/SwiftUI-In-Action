//
//  RowView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct RowView: View {
  @EnvironmentObject var listViewModel: ListViewModel;
  var item: ListModel;
  init(_ item: ListModel) {
    self.item = item;
  }
  var body: some View {
    HStack {
      Image(systemName: item.completed ? "checkmark.circle" : "circle")
        .foregroundColor((item.completed ? .green : .red))
      Text(item.text)
      Spacer()
    }
    .font(.title2)
    .padding(.vertical, 8)
    .onTapGesture {
      withAnimation(.linear) {
        listViewModel.toggleItem(item: item)
        // print("click item toggle ✅")
      }
    }
  }
}

//struct RowView_Previews: PreviewProvider {
//  static var previews: some View {
//    RowView()
//  }
//}

