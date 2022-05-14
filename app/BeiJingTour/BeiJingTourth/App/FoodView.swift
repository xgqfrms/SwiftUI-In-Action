//
//  ContentView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/12.
//

import SwiftUI


struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    // content.font(Font.system(Font.TextStyle.title, design: Font.Design.self));
     content
      .font(.system(.title, design: .serif))
      .foregroundColor(Color("ColorBrownAdaptive"))
      .padding(8)
  }
}

struct FoodView: View {
  let headers: [HeaderModel] = HeadersData;
  let leftsData: [LeftModel] = LeftData;
  let rightsData: [RightModel] = RightData;
  let foodCardData: [FoodCardModel] = FoodCardData;
  let snackBarData: [SnackBarModel] = SnackBarData;
  let titleModifier: TitleModifier = TitleModifier();
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      // Header
      VStack {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 0) {
            ForEach(headers){ item in 
              HeaderView(header: item);
            }
          }
        }
      }
      // Table
      Text("小吃烹饪方式")
        .fontWeight(.bold)
        // .modifier(TitleModifier())
        .modifier(titleModifier)
      TableView(leftData: leftsData, rightData: rightsData)
        .background(.white)
        //.background(Color("ColorBrownAdaptive"))
        .frame(maxWidth: 640);
      // FoodCard
      Text("特色北京小吃")
        .fontWeight(.bold)
        .modifier(TitleModifier())
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 60) {
          ForEach(foodCardData) { item in
            FoodCardView(foodCard: item);
          }
        }
      }
      // SnackBar
      Text("特色小吃店")
        .fontWeight(.bold)
        .modifier(TitleModifier())
      VStack(alignment: .center, spacing: 20) {
         ForEach(snackBarData) { item in
           SnackBarView(snackBar: item);
         }
      }
      // Footer
      VStack (alignment: .center, spacing: 20) {
        Text("关于北京的小吃")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(Color("ColorBrownAdaptive"))
          .padding(8);
        Text("北京小吃，历史悠久，技艺精湛，品种繁多。荟萃我国大江南北、长城内外的风味。愿《北京旅游》App能拓宽您的视野，丰富您的生活！")
          .font(.system(.body, design: .serif))
          .multilineTextAlignment(.center)
          .foregroundColor(Color.gray)
          .frame(minHeight: 60);
      }
      .frame(maxWidth: 640)
      .padding()
      .padding(.bottom, 85)
    }
    .edgesIgnoringSafeArea(.all)
  }
}

// preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
