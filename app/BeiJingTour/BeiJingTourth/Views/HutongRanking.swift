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
//  init(_ ht: HutongModel) {
//    self.hutong = ht;
//  }
  // 形参与实参可以同名
  init(_ hutong: HutongModel) {
    self.hutong = hutong;
    // self.animate = false;
  }
  let lineGradient: LinearGradient = LinearGradient(
    gradient: Gradient(colors: [Color("ColorBrownLight"), Color("ColorBrownMedium")]),
    startPoint: .top,
    endPoint: .bottom
  );
  private func delay() async {
    // Delay of 1.0 seconds (1 second = 1_000_000_000 nanoseconds)
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    self.animate = true;
  }
  var body: some View {
    VStack {
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
        .animation(Animation.easeInOut(duration: 1), value: UUID())
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
            // .padding() ✅
            // padding() ❌ Thread 1: EXC_BAD_ACCESS (code=2, address=0x7ff7bd7f8ff8)
          Text("胡同评分")
            .font(.system(.body, design: .serif))
            .fontWeight(.heavy)
        }
        .foregroundColor(Color("ColorBrownMedium"))
        .padding(.top, 65)
        .frame(width: 180)
        //
        Text(hutong.title)
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(Color("ColorBrownMedium"))
          .padding(.vertical, 12)
          .padding(.horizontal, 0)
          .frame(width: 220)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(LinearGradient(
                gradient: Gradient(colors: [.white, Color("ColorBrownLight")]),
                startPoint: .top,
                endPoint: .bottom
              ))
              .shadow(color: Color("ColorLight"), radius: 6, x: 0, y: 6)
          )
        Spacer();
//        Text(hutong.desc)
//          .fontWeight(.bold)
//          // .foregroundColor(.white)
//          .foregroundColor(.green)
//          // .lineLimit(nil)
//          .frame(width: 220, alignment: .leading)
        HStack(alignment: .firstTextBaseline, spacing: 0) {
          Text(hutong.desc)
            .fontWeight(.bold)
            // .foregroundColor(.white)
            .foregroundColor(.green)
            .lineLimit(nil)
            .frame(width: 220)
        }
        Spacer();
        Text(hutong.times)
          .font(.system(.callout, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(.white)
          .shadow(radius: 3)
          .padding(.vertical)
          .padding(.horizontal, 0)
          .frame(width: 185)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(LinearGradient(
                gradient: Gradient(colors: [Color("ColorBrownMedium"), Color("ColorBrownDark")]),
                startPoint: .top,
                endPoint: .bottom
              ))
              .shadow(color: Color("ColorLight"), radius: 6, x: 0, y: 6)
          )
        Spacer();
        Text(hutong.feature)
          .font(.footnote)
          .fontWeight(.bold)
          .foregroundColor(Color("ColorBrownLight"))
          .lineLimit(3)
          .frame(width: 160)
        Spacer();
        //
      }
      .zIndex(0)
      .multilineTextAlignment(.center)
      .padding(.horizontal)
      .frame(width: 260, height: 485, alignment: .center)
      // .background(LinearGradient(gradient: Gradient(colors: [Color("ColorBrownLight"), Color("ColorBrownMedium")]), startPoint: .top, endPoint: .bottom))
      .background(lineGradient)
      .cornerRadius(20)
    }
    .onAppear() {
      /*
       */
      self.animate = false;
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        // ✅
        self.animate = true;
        // self.animate.toggle();
        // print("Async after 1 seconds");
      }
      // animate.toggle();
      // self.animate.toggle();
      // self.animate = false;
      // sleep(UInt32(1.0));
      // self.animate = true;
      // sleep(1.0);
      // Cannot convert value of type 'Double' to expected argument type 'UInt32'
      // Replace '1.0' with 'UInt32(1.0)'
      // delay
      // Text("").task(self.delay);
      // Converting non-sendable function value to '@Sendable () async -> Void' may introduce data races
      // Result of call to 'task(priority:_:)' is unused
      // self.delay();
      // ❌ 'async' call in a function that does not support concurrency
    }
    .onDisappear() {
      // self.animate.toggle();
      // self.animate = false;
    }
//    .onAppear() {
//      // self.animate.toggle();
//      self.animate = true;
//    }
//    .onDisappear() {
//      // self.animate.toggle();
//      self.animate = false;
//    }
  }
}

//struct HutongRanking_Previews: PreviewProvider {
//    static var previews: some View {
//        HutongRanking()
//    }
//}
