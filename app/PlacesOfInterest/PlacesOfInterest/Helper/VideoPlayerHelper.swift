//
//  VideoPlayerHelper.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/3.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo (_ filename: String, _ format: String) -> AVPlayer {
  // let url = Bundle.main.url(forResource: filename, withExtension: format)!;
  let url = Bundle.main.url(forResource: filename, withExtension: format);
  if(url != nil) {
    videoPlayer = AVPlayer(url: url!);
    videoPlayer?.play();
  }
  return videoPlayer!;
}

//struct VideoPlayerHelper_Previews: PreviewProvider {
//  static var previews: some View {
//    VideoPlayerHelper()
//  }
//}
