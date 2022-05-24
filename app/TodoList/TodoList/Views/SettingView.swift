//
//  SettingView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/24.
//

import SwiftUI

struct SettingView: View {
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      Image("Logo")
        .resizable()
        .scaledToFit()
        .padding(.top)
        .frame(width: 100, height: 100, alignment: .center)
        .shadow(color: .pink, radius: 8, x: 0, y: 4)
      // Form
      SettingForm();
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
