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
        Text(place.name)
        Text(place.headline)
        Text(place.description)
        Text(place.name)
        Text(place.link)
        Text(place.image)
        Text(place.name)
        ForEach(place.gallery, id: \.self) {gallery in
          Text(gallery)
        }
        ForEach(place.message, id: \.self) {message in
          Text(message)
        }
        // Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'String' conform to 'Identifiable'
        // id: \.self
      }
    }
    .navigationBarTitle("了解更多 \(place.name)", displayMode: .inline)
  }
}

struct PlaceDetailView_Previews: PreviewProvider {
  static let places: [PlaceModel] = Bundle.main.decode("places.json");
  static var previews: some View {
    PlaceDetailView(places[0])
      .previewDevice("iPhone 12 Pro")
  }
}
