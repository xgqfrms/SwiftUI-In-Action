//
//  RightView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/14.
//

import SwiftUI

struct RightView: View {
  // var rights: [RightModel] = RightData;
  var rights: [RightModel];
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      ForEach(rights) {item in
        HStack {
          Text(item.text);
          Spacer();
          Image(item.image)
            .resizable()
            .modifier(IconModifier());
        }
        if(item.text != "煨") {
          Divider();
        }
      }
    }
  }
}

//struct RightView_Previews: PreviewProvider {
//    static var previews: some View {
//        RightView()
//    }
//}
