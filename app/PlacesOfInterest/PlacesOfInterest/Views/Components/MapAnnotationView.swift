//
//  MapAnnotationView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/4.
//

import SwiftUI
// import MapKit
// MapAnnotation<<#Content: View#>>

struct MapAnnotationView: View {
  // private let locations: [LocationModel] = Bundle.main.decode("locations.json");
  var location: LocationModel;
  init(_ location: LocationModel) {
    self.location = location;
  }
  @State private var animate: Double = 0.0;
  private let animation = Animation.easeOut(duration: 2).repeatForever(autoreverses: false);
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.accentColor)
        .frame(width: 54, height: 54, alignment: .center)
      Circle()
        .stroke(Color.accentColor, lineWidth: 2)
        .frame(width: 52, height: 52, alignment: .center)
        // CGFloat: 64 位 / 32 位 浮点数
        .scaleEffect(1 + CGFloat(animate))
        .opacity(1 - animate)
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width: 48, height: 48, alignment: .center)
        .clipShape(Circle())
    }
    .onAppear {
      withAnimation(animation) {
        animate = 1;
      }
    }
  }
}

//struct MapAnnotationView_Previews: PreviewProvider {
//  static var previews: some View {
//    MapAnnotationView()
//  }
//}
