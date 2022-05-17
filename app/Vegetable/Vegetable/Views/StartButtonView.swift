//
//  StartButtonView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

struct StartButtonView: View {
  // 可选变量
  @AppStorage("isFirst") var isFirst: Bool?;
  var body: some View {
    Button(action: {
      print("关闭引导");
      isFirst = false;
    }, label: {
      Text("关闭引导");
    });
  }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
    }
}
