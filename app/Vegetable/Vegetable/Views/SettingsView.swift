//
//  SettingsView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/18.
//

import SwiftUI

struct SettingsView: View {
  var developer: [DeveloperModel] = DeveloperData;
  // @Environment(\.presentationMode) var presentationMode;
  @Environment(\.presentationMode) var isShowSettings;
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false){
        VStack {
          // LableView 接收两个匿名参数 🚀
          GroupBox(label: LabelView("蔬菜百科", "info.circle")) {
            Divider()
              .padding(.vertical, 4);
            HStack(alignment: .center, spacing: 10) {
              Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .cornerRadius(9)
              Text("蔬菜是指可以做菜、烹饪成为食品的一类植物或菌类，蔬菜是人们日常饮食中必不可少的食物之一。蔬菜可提供人体所必需的多种维生素和矿物质等营养物质。本App的目的就是让更多的人了解每种蔬菜的特性。")
                .font(.footnote)
            }
          }
          GroupBox(label: LabelView("应用程序", "info.circle")) {
            ForEach(developer) {item in
              Divider()
                .padding(.vertical, 4);
              DeveloperView(item.key, value: item.value, isURL: item.isURL);
            }
          }
        }
        // .navigationBarTitle(Text("设置"), displayMode: .large)
        .navigationBarTitle("设置", displayMode: .large)
        .navigationBarItems(trailing: Button(
          action: {
            print("close");
            // isShowSettings 接收 sheet 抽屉弹层传递过来的变量 showSettings
            // dismiss 修改外部递过来的变量
            isShowSettings.wrappedValue.dismiss();
          },
          label: {
            // Image(systemName: "xmark")
            Image(systemName: "xmark.circle")
              .foregroundColor(.red)
          }
        ))
        .padding();
      }
    }
  }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
