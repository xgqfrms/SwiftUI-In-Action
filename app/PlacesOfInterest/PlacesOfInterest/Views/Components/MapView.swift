//
//  MapView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI
import MapKit

struct MapView: View {
  // 纬度 Latitude :  31.2639786
  // 经度 Longitude :  121.3897594
  @State private var region = MKCoordinateRegion(
    // 上海坐标
    center: CLLocationCoordinate2D(latitude: 31.2639786, longitude: 121.3897594),
    // 重庆坐标
    // center: CLLocationCoordinate2D(latitude: 31.574565, longitude: 108.884720),
    // 跨度，中国范围
    span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60)
  );
  // ???
  @State private var locationRegion: MKCoordinateRegion = {
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
  //
  private let locations: [LocationModel] = Bundle.main.decode("locations.json");
  var body: some View {
    // $var 引用类型, var 值类型
    // Map(coordinateRegion: $region)
    Map(coordinateRegion: $region, annotationItems: locations) { location in
      MapPin(coordinate: location.location, tint: .accentColor)
    }
      // 弹层
      .overlay(
        NavigationLink(destination: MapListView()) {
          HStack{
            Image(systemName: "mappin.circle")
              .foregroundColor(.white)
              .imageScale(.large)
            Text("所在位置")
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
          }
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(
            Color
              .black
              .opacity(0.4)
              .cornerRadius(8)
          )
        }
        .padding(12),
        alignment: .topTrailing
      )
      .frame(height: 256)
      .cornerRadius(12)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
