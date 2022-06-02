//
//  MessageView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct MessageView: View {
  let pagination = PageTabViewStyle();
  let message: [String];
  init(_ message: [String]) {
    self.message = message;
  }
  var body: some View {
    TabView {
      ForEach(message, id: \.self) {item in
        Text(item)
      }
    }
    // .foregroundColor(.white)
    // .background(.gray)
    .tabViewStyle(pagination)
    .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
  }
}

//struct MessageView_Previews: PreviewProvider {
//  static var previews: some View {
//    MessageView()
//  }
//}
