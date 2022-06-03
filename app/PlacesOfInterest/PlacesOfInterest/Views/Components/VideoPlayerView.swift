//
//  VideoPlayerView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/3.
//

import SwiftUI
import AVKit
// Audio Video Kit

struct VideoPlayerView: View {
  let video: VideoModel;
  // let url: URL;
  init(_ video: VideoModel) {
    self.video = video;
    // self.url = Bundle.main.url(forResource: video.name, withExtension: "mov")!;
  }
  var body: some View {
    VStack {
//      Text(video.name)
//        .font(.title)
//        .foregroundColor(.accentColor)
      VideoPlayer(
        // player: AVPlayer(url: url)
        player: playVideo(video.name, "mov")
      )
      // 遮罩层
      .overlay(
        HStack {
          Text(video.name)
            .font(.title)
            .foregroundColor(.accentColor)
          // Spacer()
          Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .padding(.top, 6)
            .padding(.horizontal, 8)
        },
        // alignment: .topTrailing
        // alignment: .topLeading
        alignment: .top
      )
    }
    // .accentColor(.accentColor)
    .navigationBarTitle(video.name, displayMode: .inline)
  }
}

//
//struct VideoPlayerView_Previews: PreviewProvider {
//  static var previews: some View {
//    VideoPlayerView()
//  }
//}
