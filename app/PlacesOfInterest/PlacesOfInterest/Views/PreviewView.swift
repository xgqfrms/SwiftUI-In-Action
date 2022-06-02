//
//  PreviewView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct PreviewView: View {
  private let places: [PlaceModel] = Bundle.main.decode("places.json");
  var body: some View {
    NavigationView {
      List {
        CoversView()
          .frame(height: 300)
          // 去除边距
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        ForEach(places) { place in
          // 详情路由
          NavigationLink(destination: PlaceDetailView(place)) {
            PlaceItemView(place)
          }
        }
      }
      .navigationBarTitle("风景概览", displayMode: .large)
      // .navigationBarTitle("风景概览", displayMode: .inline)
    }
  }
}

//struct PreviewView_Previews: PreviewProvider {
//  static var previews: some View {
//    PreviewView()
//  }
//}
