//
//  EditButtonBugView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct EditButtonBugView: View {
  @State private var fruits = [
    "Apple",
    "Banana",
    "Papaya",
    "Mango"
  ]
  var body: some View {
    NavigationView {
      List {
        ForEach(fruits, id: \.self) { fruit in
          Text(fruit)
        }
        // 
        .onDelete { fruits.remove(atOffsets: $0) }
        .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
      }
      .navigationTitle("Fruits")
      .toolbar {
        EditButton()
          .foregroundColor(.accentColor)
      }
    }
  }
}

struct EditButtonBugView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonBugView()
    }
}
