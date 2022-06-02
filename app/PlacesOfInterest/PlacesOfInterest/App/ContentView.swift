//
//  ContentView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/5/19.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      PreviewView()
        .tabItem {
          Image(systemName: "square.grid.2x2")
          Text("风景概览")
        }
      VideoListView()
        .tabItem {
          Image(systemName: "play.rectangle")
          Text("风景视频")
        }
      MapListView()
        .tabItem {
          Image(systemName: "map")
          Text("风景地图")
        }
      ImageListView()
        .tabItem {
          Image(systemName: "photo")
          Text("风景照片")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
