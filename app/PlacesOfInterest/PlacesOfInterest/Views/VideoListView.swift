//
//  VideoListView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct VideoListView: View {
  // private let videos: [VideoModel] = Bundle.main.decode("videos.json");
  @State private var videos: [VideoModel] = Bundle.main.decode("videos.json");
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) {video in
          NavigationLink(destination: VideoDetailView(video)) {
            VideoItemView(video)
              .padding(.vertical, 8)
          }
        }
      }
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("视频", displayMode: .inline)
      // toolbar
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing){
          Button(action: {
            // 随机排序
            videos.shuffle();
          }) {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    }
  }
}

//struct VideoListView_Previews: PreviewProvider {
//  static var previews: some View {
//    VideoListView()
//  }
//}
