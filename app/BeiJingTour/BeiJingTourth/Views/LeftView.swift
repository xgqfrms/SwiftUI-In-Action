//
//  LeftView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/14.
//

import SwiftUI

struct LeftView: View {
  // var lefts: [LeftModel] = LeftData;
  var lefts: [LeftModel];
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      ForEach(lefts) { item in
        HStack {
          Image(item.image)
            .resizable()
            .modifier(IconModifier());
          Spacer();
          Text(item.text);
        }
        if(item.text != "爆") {
          Divider();
        }
      }
    }
  }
}

//struct LeftView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeftView()
//    }
//}
