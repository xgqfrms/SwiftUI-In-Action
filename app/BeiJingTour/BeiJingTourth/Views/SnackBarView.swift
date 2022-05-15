//
//  SnackBarView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/14.
//

import SwiftUI

struct SnackBarView: View {
  var snackBar: SnackBarModel;
  // 触控反馈
  let hapticImpact = UIImpactFeedbackGenerator(style: .heavy);
  @State private var showModal: Bool = false;
  @State private var marked: Bool = false;
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Image(snackBar.image)
        .resizable()
        .scaledToFit()
        // 浮动视图
//        .overlay(
//          HStack {
//            Spacer()
//            VStack{
//              // 书签
//              Image(systemName: "bookmark")
//                .font(.title.weight(.light))
//                .foregroundColor(.white)
//                .imageScale(.small)
//                .shadow(color: Color("ColorLight"), radius: 2, x: 0, y: 0)
//                .padding(.trailing, 20)
//                .padding(.top, 22);
//              Spacer()
//            }
//          }
//        )
        .overlay(
          HStack {
            Spacer()
            VStack{
              // 书签
              
              Button(action: {
                print("✅ self.marked = \(self.marked)");
                // self.marked = true;
                self.marked.toggle();
              }, label: {
                Image(systemName: "bookmark")
                  .font(.title.weight(.light))
                  // .foregroundColor(.white)
                  .foregroundColor(marked ? .yellow : .white)
                  .imageScale(.small)
                  .shadow(color: Color("ColorLight"), radius: 2, x: 0, y: 0)
                  .padding(.trailing, 20)
                  .padding(.top, 22);
              });
              Spacer()
            }
          }
        )
      // 
      //
      VStack(alignment: .leading, spacing: 12) {
        Text(snackBar.title)
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(Color("ColorBrownMedium"))
          .lineLimit(1)
        Text(snackBar.headline)
          .font(.system(.body, design: .serif))
          .foregroundColor(.gray)
        // 评分
        StarRatingView(snackBar);
        // StarRatingView(snackBar: snackBar);
        // infos
        SnackInfoView(snackBar);
        // SnackInfoView(snackBar: snackBar);
      }
      .padding()
      .padding(.bottom, 12)
    }
    .background(.white)
    .cornerRadius(12)
    .shadow(color: Color("ColorLight"), radius: 8, x: 0, y: 0)
    .onAppear() {
      self.marked = false;
      // self.marked.toggle();
    }
    // 点击
    .onTapGesture {
      self.hapticImpact.impactOccurred()
      self.showModal = true;
    }
    // 模态框， $ 引用类型，不能使用 值类型
    .sheet(isPresented: $showModal) {
      SnackDetailView(self.snackBar);
      // SnackInfoView(snackBar: snackBar);
    }
  }
}

struct SnackBarView_Previews: PreviewProvider {
  static var previews: some View {
    SnackBarView(snackBar: SnackBarData[0])
      .previewLayout(.sizeThatFits)
  }
}
