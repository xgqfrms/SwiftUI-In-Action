//
//  GalleryView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct GalleryView: View {
  // let place: PlaceModel;
  let gallery: [String];
  init(_ gallery: [String]) {
    self.gallery = gallery;
  }
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 15) {
        // ForEach(place.gallery, id: \.self) {item in
        ForEach(gallery, id: \.self) {item in
          Image(item)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .cornerRadius(12)
        }
      }
    }
  }
}

//struct GalleryView_Previews: PreviewProvider {
//  static var previews: some View {
//    GalleryView()
//  }
//}
