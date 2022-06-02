//
//  PlaceDetailView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct PlaceDetailView: View {
  let place: PlaceModel;
  init(_ place: PlaceModel) {
    self.place = place;
  }
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        Image(place.image)
          .resizable()
          .scaledToFit()
        Text(place.name)
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .padding(.vertical, 8)
          .foregroundColor(.primary)
          .background(
            // 下划线
            Color.accentColor
              .frame(height: 6)
              .offset(y: 24)
          )
        Text(place.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)
        Group {
          HeadingView("中国名胜古迹 图片", "photo.on.rectangle.angled")
          GalleryView(place.gallery)
        }
        .padding(.horizontal)
        Group {
          HeadingView("你知道吗", "questionmark.circle")
          MessageView(place.message)
        }
        .padding(.horizontal)
        Group {
          HeadingView("关于 \(place.name)", "info.circle")
          Text(place.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        }
        .padding(.horizontal)
        // Text(place.link)
      }
    }
    .navigationBarTitle("了解更多 \(place.name)", displayMode: .inline)
    // .edgesIgnoringSafeArea(.all)
  }
}

struct PlaceDetailView_Previews: PreviewProvider {
  static let places: [PlaceModel] = Bundle.main.decode("places.json");
  static var previews: some View {
    PlaceDetailView(places[0])
      .previewDevice("iPhone 12 Pro")
      .preferredColorScheme(.dark)
  }
}
