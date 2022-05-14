//
//  HeaderView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/13.
//

import SwiftUI


struct HeaderView: View {
  @State private var showHeadline = false;
  var header: HeaderModel;
  var slideInAnimation: Animation {
    Animation
      .spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
      .speed(1)
      .delay(0.25)
  }
  var body: some View {
    ZStack {
      Image(header.image)
        .resizable()
        .scaledToFill()
      HStack (alignment: .top, spacing: 0) {
        Rectangle()
          .fill(Color("ColorBrownMedium"))
          .opacity(0.7)
          .frame(width: 4)
        VStack(alignment: .leading, spacing: 6) {
          Text(header.headline)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .shadow(radius: 3)
          Text(header.subtitle)
            .font(.footnote)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .shadow(radius: 3)
        }
        .padding(.vertical, 0)
        .padding(.horizontal, 20)
        .frame(width: 281, height: 105)
        .background(Color("ColorLight"))
      }
      .frame(width: 285, height: 105, alignment: .center)
      .offset(x: -66, y: showHeadline ? 80 : 190)
      .animation(slideInAnimation, value: UUID())
      // 'animation' was deprecated in iOS 15.0: Use withAnimation or animation(_:value:) instead.
      .onAppear {
        showHeadline = true;
      }
      .onDisappear() {
        showHeadline = false;
      }
    }//
    .frame(width: 480, height: 320, alignment: .center)
  }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
      // HeaderView()
      Group {
        HeaderView(header: HeadersData[0]).preferredColorScheme(.light).previewInterfaceOrientation(.portraitUpsideDown)
        HeaderView(header: HeadersData[0]).preferredColorScheme(.dark).previewInterfaceOrientation(.portraitUpsideDown)
      }
    }
}
