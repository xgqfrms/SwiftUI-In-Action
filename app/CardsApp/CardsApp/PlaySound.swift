//
//  PlaySound.swift
//  CardsApp
//
//  Created by 夏凌晨 on 2022/5/11.
//

import Foundation

// 音频/视频
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path));
      audioPlayer?.play();
    } catch {
      print("❌无法播放音频文件");
    }
  }
}

func playSound2(sound: String, type: String) {
  let path = Bundle.main.path(forResource: sound, ofType: type);
  // Optional type 'String?' cannot be used as a boolean; test for '!= nil' instead
  // if (path) {
  if (path != nil) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path ?? "mp3"));
      // Cannot force unwrap value of non-optional type 'String'
      audioPlayer?.play();
    } catch {
      print("❌无法播放音频文件");
    }
  }
}
