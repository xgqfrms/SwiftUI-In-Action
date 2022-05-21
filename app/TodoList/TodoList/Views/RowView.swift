//
//  RowView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct RowView: View {
  var item: ListModel;
  init(_ item: ListModel) {
    self.item = item;
  }
//  var item: String;
  var body: some View {
    HStack {
      Image(systemName: item.completed ? "checkmark.circle" : "circle")
        .foregroundColor((item.completed ? .green : .red))
      Text(item.text)
      Spacer()
//      Image(systemName: "checkmark.circle")
//        .foregroundColor(.green)
//      Text(item)
//      Spacer()
    }
    .onTapGesture(perform: {
      print("click item")
    })
  }
}

//struct RowView_Previews: PreviewProvider {
//  static var previews: some View {
//    RowView()
//  }
//}

