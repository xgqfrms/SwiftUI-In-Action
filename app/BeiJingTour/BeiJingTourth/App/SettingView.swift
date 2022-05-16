//
//  SettingView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/13.
//

import SwiftUI

struct SettingView: View {
  // background 切换 / logo 切换
  @State private var defaultLogo: Bool = true;
  // Cannot declare local wrapped variable in result builder
  // TODO: 子组件，更新父组件中的属性状态，变量值 ？？？
  func updateLogo(flag: Bool) -> Void {
    // self.defaultLogo.toggle();
    self.defaultLogo = flag;
  }
  // TODO: 子组件，调用父组件中的方法
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      Image(defaultLogo ? "Beijing-Logo" : "Shanghai-Logo")
        .resizable()
        .scaledToFit()
        .padding(.top)
        .frame(width: 100, height: 100, alignment: .center)
        .shadow(color: Color("ColorLight"), radius: 8, x: 0, y: 4)
      //
      Text("设置 ⚙️")
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(Color("ColorBrownAdaptive"))
      // Form
      SettingForm(defaultLogo);
      // SettingForm($defaultLogo);
      // Cannot convert value '$defaultLogo' of type 'Binding<Bool>' to expected type 'Bool', use wrapped value instead
      // Remove '$'
    }
    .padding()
    .frame(maxWidth: 640)
  }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
