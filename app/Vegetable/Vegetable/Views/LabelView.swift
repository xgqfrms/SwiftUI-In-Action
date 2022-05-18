//
//  LabelView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/18.
//

import SwiftUI

struct LabelView: View {
  var labelName: String;
  var labelIcon: String?;
  init(_ name: String, _ icon: String) {
    self.labelName = name;
    self.labelIcon = icon;
  }
  var body: some View {
    HStack {
      Text(labelName);
      Spacer();
      Image(systemName: labelIcon ?? "info.circle")
        .foregroundColor(.green);
    }
  }
}

//struct LabelView_Previews: PreviewProvider {
//    static var previews: some View {
//        LabelView()
//    }
//}
