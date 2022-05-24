//
//  AddItemView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct AddItemView: View {
  @EnvironmentObject var listViewModel: ListViewModel;
  // @Environment(\.presentationMode) var presentationMode;
  // @Environment(\.presentationMode) var env: Binding<PresentationMode>
  @Environment(\.presentationMode) var env;
  @State private var text: String = "";
  @State var showAlert: Bool = false;
  let minLength: Int = 3;
  func getAlert() -> Alert {
    // 不支持动态 String 赋值 ❌
    // let alertText = "AlertText";
    // return Alert(title: Text(alertText))
    return Alert(title: Text("AlertText"))
  }
  func checkInput() -> Bool {
    if(text.count < minLength) {
      showAlert.toggle()
      return false
    }
    return true
  }
  func clickSave() {
    if(checkInput()) {
      listViewModel.addItem(text);
      // 返回列表视图
      env.wrappedValue.dismiss();
      // print("save success ✅")
    } else {
      // print("save error ❌")
    }
  }
  // 自定义 返回
  var customBack : some View {
    Button(
      action: {
        self.env.wrappedValue.dismiss();
      },
      label: {
        HStack {
          Image(systemName: "chevron.backward")
          Text("Back")
        }
      }
    )
  }
  var body: some View {
    ScrollView {
      VStack {
        TextField("Placeholder", text: $text)
          .padding(.horizontal)
          .frame(height: 55)
          // SettingForm 自带透明度
          .background(Color(UIColor.secondarySystemBackground))
          .cornerRadius(10)
        Button(
          action: clickSave,
          label: {
            // 不支持动态 String ❌
            // Text("Save".uppercased())
            Text("Save")
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
    .navigationTitle("AddItem")
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: customBack)
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
