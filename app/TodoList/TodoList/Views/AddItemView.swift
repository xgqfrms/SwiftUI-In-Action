//
//  AddItemView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

//import UIKit
//import Foundation

struct AddItemView: View {
  @State private var input: String = "";
  // let color: UIColor = ColorLiteral;
  // Cannot find 'ColorLiteral' in scope
  var body: some View {
    ScrollView {
      VStack {
        TextField("please input your idea ...", text: $input)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(UIColor.secondarySystemBackground))
        // .foregroundColor(.secondary)
        // Color Literal ❌ not exist
        // .background(Color(.green))
        // .background(Color(#colorLiteral(red: 0.0, green: 1.0, blue: 0.0, alpha: 255)))
        // .background(Color(.gray))
        // .background(Color("customGreen"))
          .cornerRadius(10)
        Button(
          action: {
            print("save input")
          },
          label: {
            Text("Save".uppercased())
              .padding()
              .font(.headline)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .foregroundColor(.white)
              .background(Color.accentColor)
              .cornerRadius(10)
          }
        )
      }
      .padding(14)
    }
    .navigationTitle("Add Item ✍🏻")
  }
}

struct AddItemView_Previews: PreviewProvider {
  static var previews: some View {
    // AddItemView()
    NavigationView {
      AddItemView()
    }
  }
}
