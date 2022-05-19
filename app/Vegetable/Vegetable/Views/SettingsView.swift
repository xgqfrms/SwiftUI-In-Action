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
  @AppStorage("isFirst") var isFirst: Bool = false;
  // UI View 上下文错误 ❌ self
  // var bgColor: Color = Color(UIColor.tertiarySystemBackground).clipShape(Shape().RoundedRectangle(cornerRadius(8), style: self.continuous));
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
              // DeveloperView(item.key, item.value, item.isURL, item.url!);
              DeveloperView(item.key, item.value, item.isURL, item.url ?? "");
            }
          }
          GroupBox(label: LabelView("引导界面", "questionmark.circle")) {
            Divider()
              .padding(.vertical, 4);
            Text("通过这个开关可以控制，再次开启或关闭引导界面, abcedefghijklmnopqrstuvwxyz ✅")
              .padding(.vertical, 8)
              // 防止长文本被系统截断，展示 ...
              .layoutPriority(1)
              .font(.footnote)
              .multilineTextAlignment(.leading)
            Toggle(isOn: $isFirst) {
              if(isFirst) {
                Text("已开启✅")
                  .fontWeight(.bold)
                  .foregroundColor(.green)
              } else {
                Text("已关闭❌")
                  .fontWeight(.bold)
                  .foregroundColor(.gray)
              }
            }
            .padding()
            // 使用系统背景色 UIColor.tertiarySystemBackground
            .background(Color(UIColor.tertiarySystemBackground).clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)));
            // .background(bgColor);
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
