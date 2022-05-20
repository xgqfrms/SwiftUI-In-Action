//
//  AddItemView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct AddItemView: View {
  @State private var input: String = "";
  @State var showAlert: Bool = false;
  @State var alertTitle: String = "";
  // var alertTitle: String = "";
  func getAlert() -> Alert {
    return Alert(title: Text(alertTitle))
  }
  func checkInput() -> Bool {
    if(input.count < 3) {
      alertTitle = "Your input text at least 3 characters long ❌";
      // Cannot assign to property: 'self' is immutable
      // Mark method 'mutating' to make 'self' mutable
      showAlert.toggle()
      return false
    }
    return true
  }
  func clickSave() {
    if(checkInput()) {
      //
    }
  }
  var body: some View {
    ScrollView {
      VStack {
        TextField("please input your idea ...", text: $input)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(UIColor.secondarySystemBackground))
          .cornerRadius(10)
        Button(
          action: {
            print("save input")
            clickSave();
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
    .alert(isPresented: $showAlert, content: getAlert)
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
