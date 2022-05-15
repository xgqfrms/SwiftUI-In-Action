//
//  SnackInfoView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/15.
//

import SwiftUI

struct SnackInfoView: View {
  let snackBar: SnackBarModel;
  // ✅ custom init, 可以省略写 labelName
  init(_ snack: SnackBarModel) {
    self.snackBar = snack;
  }
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "person.3")
        Text("可用餐人数: \(snackBar.serves)")
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "clock")
        Text("准备时长: \(snackBar.preparation)")
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "flame")
        Text("热度: \(snackBar.hot)")
      }
    }
    .font(.footnote)
    .foregroundColor(.gray)
  }
}

//struct SnackInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        SnackInfoView(snackBar: SnackBarData[0])
//        .previewLayout(.fixed(width: 320, height: 60))
//    }
//}
