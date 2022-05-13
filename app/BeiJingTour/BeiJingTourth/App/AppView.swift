//
//  AppView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/13.
//

import SwiftUI

struct AppView: View {
    var body: some View {
      // tabs 场景视图
      TabView {
        BeiJingView()
          .tabItem({
            Image("TabIcon-Beijing")
            Text("北京")
          });
        FoodView()
          .tabItem({
            Image("TabIcon-Food")
            Text("小吃")
          });
        HuTongView()
          .tabItem({
            Image("TabIcon-Hutong")
            Text("胡同")
          });
        SettingView()
          .tabItem({
            Image("TabIcon-Settings")
            Text("设置")
          });
      }
      // .accentColor(Color.primary)
      .accentColor(Color.green)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        // AppView()
      Group {
        AppView().preferredColorScheme(.light).previewInterfaceOrientation(.portraitUpsideDown)
        AppView().preferredColorScheme(.dark).previewInterfaceOrientation(.portraitUpsideDown)
      }
    }
}
