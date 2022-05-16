//
//  SettingForm.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/16.
//

import SwiftUI

struct SettingForm: View {
  @State private var noticeSwitch: Bool = false;
  @State private var bgSwitch: Bool = false;
  @State private var advancedSwitch: Bool = true;
  var developer: String = "xgqfrms";
  var version: String = "v1.0.0";
  var date: String = "2022-01-01";
  var logo: Bool;
  init(_ logo: Bool) {
    self.logo = logo;
  }
  var body: some View {
    Form {
      Section(header: Text("通用设置")) {
        Toggle(isOn: $noticeSwitch) {
          Text("开启消息通知")
        }.onTapGesture {
          // parent.updateLogo($noticeSwitch);
          print("子组件，调用父组件中的方法")
        }
        Toggle(isOn: $advancedSwitch) {
          Text("高级设置")
        }
        Toggle(isOn: $bgSwitch) {
          Text("刷新背景")
        }
      }
      Section(header: Text("通知设置")) {
        if(noticeSwitch) {
          Text("Twitter 通知开启✅")
          Text("Google 通知开启✅")
          Toggle(isOn: $noticeSwitch) {
            Text("通知开启✅")
          }
        } else {
          Text("Twitter 通知关闭❌")
          Text("Google 通知关闭❌")
          Toggle(isOn: $noticeSwitch) {
            Text("通知关闭❌")
          }
        }
      }
      Section(header: Text("高级设置")) {
        if(advancedSwitch) {
          HStack{
            HStack{
              Image(systemName: "person")
              Text("开发: ")
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
          Text("已关闭，请开启")
        }
      }
      Section(header: Text("刷新背景设置")) {
        if(bgSwitch) {
          Text("刷新背景开启").task {
            print("开启刷新背景✅")
          }
        } else {
          Text("关闭").task {
            print("关闭刷新背景❌")
          }
        }
      }
    }
  }
}

//struct SettingForm_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingForm()
//    }
//}
