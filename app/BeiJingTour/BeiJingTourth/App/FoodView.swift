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
  let titleModifier: TitleModifier = TitleModifier();
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      // 1
      VStack {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 0) {
            ForEach(headers){ item in 
              HeaderView(header: item);
            }
          }
        }
      }
      // 2
      Text("小吃烹饪方式")
        .fontWeight(.bold)
        // .modifier(TitleModifier())
        .modifier(titleModifier)
      // 3
      TableView(leftData: leftsData, rightData: rightsData)
        .frame(maxWidth: 640);
      // 4
      VStack {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .center, spacing: 20) {
            // FooterView();
            Text("Food Footer🍜")
              .padding()
              .foregroundColor(.accentColor)
          }
        }
      }
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
