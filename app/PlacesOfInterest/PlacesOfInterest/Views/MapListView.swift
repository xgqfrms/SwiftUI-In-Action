//
//  MapListView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI
import MapKit

struct MapListView: View {
  // 传参
//  var location: LocationModel;
//  init(_ location: LocationModel) {
//    self.location = location;
//  }
//  var place: PlaceModel;
//  init(_ place: PlaceModel) {
//    self.place = place;
//  }
  @State private var region: MKCoordinateRegion = {
    // 中心
    let center = CLLocationCoordinate2D(
      latitude: 30.555624612131368,
      longitude: 114.30381222526006
    )
    // 缩放
    let span = MKCoordinateSpan(
      latitudeDelta: 25.0,
      longitudeDelta: 25.0
    )
    return MKCoordinateRegion(center: center, span: span);
  } ();
  private let locations: [LocationModel] = Bundle.main.decode("locations.json");
  var body: some View {
    // $var 引用类型, var 值类型
    // Map(coordinateRegion: $region)
    Map(coordinateRegion: $region, annotationItems: locations) { location in
      // MapPin(coordinate: location.location, tint: .accentColor)
      // MapMarker(coordinate: location.location, tint: .accentColor)
      // 自定义标注
      /*
       MapAnnotation(coordinate: location.location) {
       Image("Logo")
       .resizable()
       .scaledToFit()
       .frame(width: 20, height: 20, alignment: .center)
       }
       */
      MapAnnotation(coordinate: location.location) {
        // 自定义标注
        MapAnnotationView(location)
      }
    }
    // 弹层
    .overlay(
      HStack {
        Image("Logo")
          .resizable()
          .scaledToFit()
          .frame(width: 48, height: 48, alignment: .center)
        VStack(alignment: .leading, spacing: 3) {
          // 抽离复用 HStack View
          HStack {
            Text("经度: ")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.longitude)")
              .font(.footnote)
              .foregroundColor(.white)
          }
          Divider()
          // 抽离复用 HStack View
          HStack {
            Text("纬度: ")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.latitude)")
              .font(.footnote)
              .foregroundColor(.white)
          }
        }
      }
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .background(
        Color
          .black
          .opacity(0.6)
          .cornerRadius(8)
      )
      .padding(12),
      alignment: .top
    )
    .frame(height: 256)
    .cornerRadius(12)
  }
}

//struct MapListView_Previews: PreviewProvider {
//  static var previews: some View {
//    MapListView()
//  }
//}
