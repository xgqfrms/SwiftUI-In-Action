//
//  AnimationBackgroundView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/4.
//

import SwiftUI

struct AnimationBackgroundView: View {
  @State private var circles = Int.random(in: 12...16);
  func randomCoordinate(_ max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0 ... max);
  }
  func randomSize() -> CGFloat {
    return CGFloat(Int.random(in: 10 ... 300));
  }
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1 ... 2.0));
  }
  @State private var animate = false;
  func randomSpeed() -> Double {
    return Double.random(in: 0.025 ... 1.0);
  }
  func randomDelay() -> Double {
    return Double.random(in: 0 ... 2);
  }
  // 弹簧效果：硬度，阻尼
  let animation = Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever();
  var body: some View {
    // 获取容器尺寸, 几何学 geometry
    GeometryReader { geometry in
      ZStack {
        ForEach(0 ..< circles, id: \.self) {item in
          Circle()
            .foregroundColor(.gray)
            .opacity(0.15)
            // .frame(width: 256, height: 256, alignment: .center)
            // .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .position(
              x: randomCoordinate(geometry.size.width),
              y: randomCoordinate(geometry.size.height)
            )
            .scaleEffect(randomScale())
            // 'animation' was deprecated in iOS 15.0: Use withAnimation or animation(_:value:) instead.
            .animation(
              animation
                .speed(randomSpeed())
                .delay(randomDelay())
            )
//            .withAnimation(){
//              animation
//                .speed(randomSpeed())
//                .delay(randomDelay())
//              ,
//              value: UUID()
//            }
            .onAppear() {
              animate = true;
            }
        }
        // Text("width: \(geometry.size.width)\nheight: \(geometry.size.height)").foregroundColor(.accentColor)
      }
      // 性能优化
      .drawingGroup()
    }
  }
}

struct AnimationView_Previews: PreviewProvider {
  static var previews: some View {
    AnimationBackgroundView()
  }
}
