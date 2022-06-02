//
//  HeadingView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct HeadingView: View {
  var text: String;
  var icon: String;
  init(_ text: String, _ icon: String) {
    self.text = text;
    self.icon = icon;
  }
  var body: some View {
    HStack() {
      Image(systemName: icon)
        .foregroundColor(.accentColor)
        .imageScale(.large)
      Text(text)
        .font(.title3)
        .fontWeight(.bold)
    }
  }
}

//struct HeadingView_Previews: PreviewProvider {
//  static var previews: some View {
//    HeadingView()
//  }
//}
