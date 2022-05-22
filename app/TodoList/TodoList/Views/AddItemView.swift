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
  // @Environment(\.presentationMode) var env;
  @Environment(\.presentationMode) var env: Binding<PresentationMode>
  @State private var text: String = "";
  @State var showAlert: Bool = false;
  // @State var alertTitle: String = "";
  let alertTitle = "Your input text at least 3 characters long ❌";
  let minLength: Int = 3;
  func getAlert() -> Alert {
    return Alert(title: Text(alertTitle))
  }
  func checkInput() -> Bool {
    if(text.count < minLength) {
      // alertTitle = "Your input text at least 3 characters long ❌";
      showAlert.toggle()
      return false
    }
    return true
  }
  func clickSave() {
    if(checkInput()) {
      print("save success ✅")
      listViewModel.addItem(text);
      // 返回列表视图
      env.wrappedValue.dismiss();
    } else {
      print("save error ❌")
    }
  }
  var customBack : some View {
    Button(
      action: {
        self.env.wrappedValue.dismiss();
      },
      label: {
//        HStack {
//          Image("ic_back")
//            .aspectRatio(contentMode: .fit)
//            .foregroundColor(.blue)
//          Text("返回")
//        }
        HStack {
          Image(systemName: "chevron.backward")
            // .imageScale(Image.Scale.large)
          Text("返回")
          // Text("待办清单")
        }
      }
    )
//    Button(action: {
//      self.env.wrappedValue.dismiss();
//    }) {
//      HStack {
//        Image("ic_back") // set image here
//          .aspectRatio(contentMode: .fit)
//          .foregroundColor(.white)
//        Text("Go back")
//      }
//    }
  }
  var body: some View {
    ScrollView {
      VStack {
        // TextField("please input your idea ...", text: $text)
        TextField("请输入你的想法 💡", text: $text)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(UIColor.secondarySystemBackground))
          .cornerRadius(10)
        Button(
          /*
          action: {
            clickSave();
          },
          */
          action: clickSave,
          label: {
            // Text("Save".uppercased())
            Text("保存".uppercased())
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
    .navigationTitle("添加待办事项 ✍🏻")
    // .navigationTitle("Add Item ✍🏻")
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
