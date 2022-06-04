//
//  ImageListView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct ImageListView: View {
  var body: some View {
    ScrollView {
      Text("风景照片")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(AnimationBackgroundView())
  }
}

struct ImageListView_Previews: PreviewProvider {
  static var previews: some View {
    ImageListView()
  }
}
