//
//  FoodCardView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/14.
//

import SwiftUI

struct FoodCardView: View {
  // @State private var foodCard;
  var foodCard: FoodCardModel;
  var lineGradient = LinearGradient(gradient: Gradient(colors: [Color("ColorBrownMedium"), Color("ColorBrownLight")]), startPoint: .leading, endPoint: .trailing);
  // var circle1 = .background(Circle().fill(lineGradient)).frame(width: 74, height: 74, alignment: .center);
  // var circle2 = .background(Circle().fill(lineGradient)).frame(width: 82, height: 82, alignment: .center);
  // var circle3 = .background(Circle().fill(lineGradient)).frame(width: 90, height: 90, alignment: .center);
  var body: some View {
    ZStack {
      Text(foodCard.text)
        // .padding()
        .padding(.leading, 55)
        .padding(.trailing, 10)
        .padding(.vertical, 3)
        .frame(width: 300, height: 135, alignment: .center)
        .background(lineGradient)
        .cornerRadius(12)
        // 多行文本
        .lineLimit(6)
        .multilineTextAlignment(.leading)
        .font(.footnote)
        .foregroundColor(.white)
      //
      Image(foodCard.image)
        .resizable()
        .frame(width: 66, height: 66, alignment: .center)
        .clipShape(Circle())
         // 圆环
        .background(Circle().fill(.white)).frame(width: 74, height: 74, alignment: .center)
        .background(Circle().fill(lineGradient)).frame(width: 82, height: 82, alignment: .center)
        .background(Circle().fill(Color("ColorAuto"))).frame(width: 90, height: 90, alignment: .center)
        .offset(x: -150)
    }
    .padding(.leading, 50)
  }
}

struct FoodCardView_Previews: PreviewProvider {
    static var previews: some View {
      FoodCardView(foodCard: FoodCardData[0])
        .previewLayout(.fixed(width: 400, height: 220))
    }
}
