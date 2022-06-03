//
//  VideoDetailView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/3.
//

import SwiftUI

struct VideoDetailView: View {
  let video: VideoModel;
  init(_ video: VideoModel) {
    self.video = video;
  }
  var body: some View {
    // video
    VStack {
      Text("视频详情")
    }
  }
}

//struct VideoDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    VideoDetailView()
//  }
//}
