//
//  StarRatingView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/15.
//

import SwiftUI

struct StarRatingView: View {
  var snackBar: SnackBarModel;
  // ✅ custom init, 可以省略写 labelName
  init(_ snack: SnackBarModel) {
    self.snackBar = snack;
  }
  var body: some View {
    HStack(alignment: .center, spacing: 5) {
      // \.slef 唯一索引 & _ 匿名参数
      ForEach(1...(snackBar.rating), id: \.self) { _ in
        Image(systemName: "star.fill")
          .font(.body)
          .foregroundColor(.yellow)
      }
    }
  }
}

//struct StarRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//      StarRatingView(snackBar: SnackBarData[0])
//        .previewLayout(.fixed(width: 320, height: 60))
//    }
//}
