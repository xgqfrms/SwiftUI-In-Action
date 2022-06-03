//
//  VideoItemView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/3.
//

import SwiftUI

struct VideoItemView: View {
  let video: VideoModel;
  init(_ video: VideoModel) {
    self.video = video;
  }
  var body: some View {
    HStack {
      ZStack() {
        // Image("视频封面-\(video.name)")
        Image(video.thumbnail)
          .resizable()
          .scaledToFit()
          .frame(height: 80)
          .cornerRadius(9)
        Image(systemName: "play.circle")
          .resizable()
          .scaledToFit()
          .frame(height: 32)
          .cornerRadius(4)
      }
      VStack(alignment: .leading, spacing: 10) {
        Text(video.name)
          .font(.title2)
          .fontWeight(.heavy)
          .foregroundColor(.accentColor)
        Text(video.headline)
          .font(.footnote)
          .multilineTextAlignment(.leading)
      }
    }
  }
}

struct VideoItemView_Previews: PreviewProvider {
  static let videos: [VideoModel] = Bundle.main.decode("videos.json");
  static var previews: some View {
    VideoItemView(videos[0])
      .previewLayout(.sizeThatFits)
  }
}
