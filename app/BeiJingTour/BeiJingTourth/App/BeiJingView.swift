//
//  BeiJingView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/13.
//

import SwiftUI

//let titleFont = .system(size: 42, weight: .bold, design: .serif);
let titleFont = Font.system(size: 42, weight: Font.Weight.bold, design: Font.Design.serif);



struct BeiJingView: View {
    // private let titleFont = Font.system(size: 42, weight: Font.Weight.bold, design: Font.Design.serif);
    // @State private var animation: Bool = false;
    @State private var animation = false;
    // var animationState = animation ? 1.0 : 0.7;
    // Cannot use instance member 'animation' within property initializer; property initializers run before 'self' is available
  func getAnimationState (_ animation: Bool) -> Double {
      return animation ? 1.0 : 0.7;
    }
    var body: some View {
      VStack {
        Spacer()
        Image("Beijing-Logo")
          .resizable()
          .scaledToFit()
          .frame(width: 240, height: 240, alignment: .center)
          .shadow(color: Color("ColorDark"), radius: 12, x: 0, y: 8)
          .scaleEffect(animation ? 1.0 : 0.7)
          .opacity(animation ? 1.0 : 0.7)
          // .scaleEffect(getAnimationState(self.animation))
          // .opacity(getAnimationState(self.animation))
          // value: UUID ✅
          .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: UUID())
          // .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
          // ⚠️ 'animation' was deprecated in iOS 15.0: Use withAnimation or animation(_:value:) instead.
          // .withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) ❌
        VStack {
          Text("北京旅游")
            .padding()
            .foregroundColor(.white)
            .font(titleFont)
            // .font(.system(size: 42, weight: .bold, design: .serif))
            .shadow(color: Color("ColorDark"), radius: 4, x: 0, y: 4)
          Text("🇨🇳 北京，是一座朴实亲切而又大气磅礴的城市既能海纳百川，又有着自己独特的风姿，既能独树一帜，又不孤芳自赏。")
            .lineLimit(nil)
            .font(.headline)
            // 前面的覆盖后面属性 ❓逆序， 先进后出，栈
            .foregroundColor(Color("ColorBrown"))
            .foregroundColor(Color.green)
            // 前面的覆盖后面属性 ❓逆序， 先进后出，栈
            .multilineTextAlignment(.center)
            .multilineTextAlignment(.leading)
            .lineSpacing(8)
            // .frame(minWidth: 640,  minHeight: 120)
            .frame(maxWidth: 640, minHeight: 120)
            .padding(.horizontal, 20)
        }
        .padding()
        Spacer()
      }
      .background(
        Image("background")
          .resizable()
          .scaledToFill()
      )
      .edgesIgnoringSafeArea(.all)
      .onAppear {
        self.animation.toggle();
      }
    }
}

struct BeiJingView_Previews: PreviewProvider {
    static var previews: some View {
        BeiJingView()
    }
}
