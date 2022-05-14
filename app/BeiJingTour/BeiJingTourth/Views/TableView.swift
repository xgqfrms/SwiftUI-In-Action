//
//  TableView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/14.
//

import SwiftUI

struct IconModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 42, height: 42, alignment: .center)
  }
}

struct TableView: View {
  var leftData: [LeftModel];
  var rightData: [RightModel];
  var body: some View {
    HStack(alignment: .center, spacing: 4) {
      // 左
      LeftView(lefts: leftData);
      // 中
      VStack(alignment: .center, spacing: 16) {
        HStack{
          Divider();
        }
        Image(systemName: "heart.circle")
          .font(Font.title.weight(.ultraLight))
        HStack{
          Divider();
        }
      }
      // 右
      RightView(rights: rightData);
    }
    // 插图标注样式字体
    .font(.callout)
    // .foregroundColor(Color.gray)
    .foregroundColor(.green)
    .background(.white)
    .padding(.horizontal)
    .frame(maxHeight: 220)
  }
}

//struct TableView_Previews: PreviewProvider {
//    static var previews: some View {
//      TableView().previewLayout(.fixed(width: 414, height: 280))
//    }
//}
