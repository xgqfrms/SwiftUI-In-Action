//
//  HutongRanking.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/16.
//

import SwiftUI

struct HutongRanking: View {
  @State private var animate: Bool = false;
  var hutong: HutongModel;
  init(_ hutong: HutongModel) {
    self.hutong = hutong;
  }
  var body: some View {
    VStack() {
      // Logo
      Image(hutong.image)
        .resizable()
        .frame(width: 100, height: 100, alignment: .center)
        .clipShape(Circle())
        .background(
          Circle()
            .fill(Color("ColorBrownLight"))
            .frame(width: 110, height: 110, alignment: .center)
        )
        .background(
          Circle()
            .fill(Color("ColorAuto"))
            .frame(width: 120, height: 120, alignment: .center)
        )
        // mulit background Group ???
        .zIndex(1)
        .offset(y: animate ? 55 : -55)
      // Card
      VStack(alignment: .center, spacing: 10) {
        VStack(alignment: .center, spacing: 0) {
          // Text("胡同评分：\(hutong.ranking)")
          //   .padding()
          // Text(hutong.ranking)
          //   .padding()
          //   .font(.system(.largeTitle, design: .serif))
          //   .fontWeight(.bold)
          // Cannot infer contextual base in reference to member 'bold'
          // Value of type 'some View' has no member 'fontWeight'
          // .padding() 放置的先后顺序很重要，返回值类型，不匹配 bug ❌
          Text(hutong.ranking)
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
            padding()
          Text("胡同评分")
            .font(.system(.body, design: .serif))
            .fontWeight(.heavy)
        }
      }
      .zIndex(0)
      .multilineTextAlignment(.center)
      .padding(.horizontal)
      //
    }
    .onAppear() {
      self.animate.toggle();
    }
  }
}

//struct HutongRanking_Previews: PreviewProvider {
//    static var previews: some View {
//        HutongRanking()
//    }
//}
