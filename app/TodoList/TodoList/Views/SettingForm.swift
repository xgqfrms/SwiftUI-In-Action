//
//  SettingForm.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/24.
//

import SwiftUI

struct SettingForm: View {
  @State private var noticeSwitch: Bool = false;
  @State private var advancedSwitch: Bool = true;
  private var developer: String = "xgqfrms";
  private var version: String = "v1.0.0";
  private var date: String = "2022-01-01";
  // @State var showAlert: Bool = false;
  @State var alertText: String = "";
  private func getAlert () -> Alert {
    // Modifying state during view update, this will cause undefined behavior.
//    if(noticeSwitch) {
//      alertText = "通知已经开启✅";
//    } else {
//      alertText = "通知已经关闭❌";
//    }
//    return Alert(title: Text("\(alertText)"))
    if(noticeSwitch) {
      let text = "通知已经开启✅";
      return Alert(title: Text("\(text)"))
    } else {
      let text = "通知已经关闭❌";
      return Alert(title: Text("\(text)"))
    }
//    if(noticeSwitch) {
//      return Alert(
//        title: Text("通知已经开启✅"),
//        message: Text("The connection to the server was lost."),
//        primaryButton: .default(
//          Text("Try Again"),
//          action: {
//            print("do nothing")
//          }
//        ),
//        secondaryButton: .destructive(
//          Text("Delete"),
//          action: {
//            print("do nothing")
//          }
//        )
//      )
//    } else {
//      return Alert(
//        title: Text("通知已经关闭❌"),
//        message: Text("The connection to the server was lost."),
//        primaryButton: .default(
//          Text("Try Again"),
//          action: {
//            print("do nothing")
//          }
//        ),
//        secondaryButton: .destructive(
//          Text("Delete"),
//          action: {
//            print("do nothing")
//          }
//        )
//      )
//    }
  }
  var body: some View {
    Form {
      Section(header: Text("通知设置")) {
        if(noticeSwitch) {
          Toggle(isOn: $noticeSwitch) {
            Text("通知开启✅")
          }
        } else {
          Toggle(isOn: $noticeSwitch) {
            Text("通知关闭❌")
          }
        }
        Toggle(isOn: $advancedSwitch) {
          Text("开发信息")
        }
      }
      Section(header: Text("开发信息")) {
        if(advancedSwitch) {
          HStack{
            HStack{
              Image(systemName: "person")
              Text("开发者: ")
            }
            Spacer()
            Text("\(developer)")
          }
          HStack{
            HStack{
              Image(systemName: "macwindow")
              Text("版本: ")
            }
            Spacer()
            Text("\(version)")
          }
          HStack{
            HStack{
              Image(systemName: "calendar")
              Text("日前: ")
            }
            Spacer()
            Text("\(date)")
          }
        } else {
          Text("已关闭，请开启查看!")
        }
      }
    }
    .alert(isPresented: $noticeSwitch, content: getAlert)
  }
}

struct SettingForm_Previews: PreviewProvider {
    static var previews: some View {
        SettingForm()
    }
}
