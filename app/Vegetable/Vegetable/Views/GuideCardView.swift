//
//  GuideCardView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/17.
//

import SwiftUI

struct GuideCardView: View {
  @State private var animate: Bool = false;
  let rgbaColor: Color = Color(red: 0, green: 0, blue: 0, opacity: 0.15);
  var card: VegetableModel;
  init(_ card: VegetableModel) {
    self.card = card;
  }
  var body: some View {
    ZStack {
      VStack() {
        Image(card.image)
          .resizable()
          .scaledToFit()
          .shadow(color: rgbaColor, radius: 8, x: 6, y: 8)
          // animate
          .scaleEffect(animate ? 1 : 0.5)
        Text(card.title)
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .shadow(color: rgbaColor, radius: 2, x: 2, y: 2)
        Text(card.headline)
          .foregroundColor(.white)
          .multilineTextAlignment(.leading)
          .padding()
          .frame(maxWidth: 480)
        StartButtonView()
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(LinearGradient(gradient: Gradient(colors: card.colors), startPoint: .top, endPoint: .bottom))
    .cornerRadius(20)
    .onAppear() {
      //
      withAnimation(.easeInOut(duration: 0.5)) {
        animate = true;
      }
    }
    .padding(.horizontal, 20)
  }
}

struct GuideCardView_Previews: PreviewProvider {
    static var previews: some View {
      // GuideCardView(card: VegetableData[0])
      GuideCardView(VegetableData[0])
        .previewLayout(.fixed(width: 320, height: 640))
    }
}
