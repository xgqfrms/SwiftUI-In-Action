//
//  PlaceItemView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct PlaceItemView: View {
  // var place: PlaceModel;
  let place: PlaceModel;
  init(_ place: PlaceModel) {
    self.place = place;
  }
  private let shape = RoundedRectangle(cornerRadius: 12);
  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      Image(place.name)
        .resizable()
        .scaledToFill()
        .frame(width: 90, height: 90)
        .clipShape(shape)
        .padding()
      VStack(alignment: .leading, spacing: 8) {
        Text(place.name)
          .font(.title2)
          .fontWeight(.heavy)
          .foregroundColor(.accentColor)
        Text(place.headline)
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
          .padding(.trailing, 8)
      }
    }
    // .background(.gray)
    // .padding()
  }
}

struct PlaceItemView_Previews: PreviewProvider {
  static let places: [PlaceModel] = Bundle.main.decode("places.json");
  static var previews: some View {
    PlaceItemView(places[0])
      // .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
