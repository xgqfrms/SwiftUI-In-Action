//
//  SnackDetailView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/15.
//

import SwiftUI

struct SnackDetailView: View {
  let snackBar: SnackBarModel;
  let titleModifier: TitleModifier = TitleModifier();
  let animate = Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true);
  // 全局变量，sheet 传递的变量存储到 presentationMode 变量中
  // @Environment(\.presentationMode) var presentationMode;
  @Environment(\.presentationMode) var hideModal;
  // @Environment(\.hideModal) var hideModal;
  // Value of type 'EnvironmentValues' has no member 'hideMode'
  @State private var pulsate: Bool = false;
  // ✅ custom init, 可以省略写 labelName
  init(_ snack: SnackBarModel) {
    self.snackBar = snack;
  }
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 0) {
        Image(snackBar.image)
          .resizable()
          .scaledToFit()
        // 使用 Group，防止一个父容器中子元素过多，导致无法渲染 bug
        Group{
          Text(snackBar.title)
            // .font 要在 .padding 前面
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("ColorBrownAdaptive"))
            .padding(.top, 10)
          // Text("评分: \(snackBar.rating)")
          // Text("准备时间: \(snackBar.serves)")
          StarRatingView(snackBar);
          SnackInfoView(snackBar);
          //
          Text("美食介绍")
            .fontWeight(.bold)
            .modifier(titleModifier)
          VStack(alignment: .leading, spacing: 5) {
            ForEach(snackBar.infos, id: \.self) {item in
              VStack(alignment: .leading, spacing: 5) {
                Text(item)
                  .font(.footnote)
                  .multilineTextAlignment(.leading)
                Divider()
              }
            }
          }
          //
          Text("制作方法")
            .fontWeight(.bold)
            .modifier(titleModifier)
          ForEach(snackBar.methods, id: \.self) {item in
            VStack(alignment: .center, spacing: 5) {
              // icon
              Image(systemName: "chevron.down.circle")
                .resizable()
                .frame(width: 36, height: 36, alignment: .center)
                .imageScale(.large)
                .font(.title.weight(.ultraLight))
                .foregroundColor(Color("ColorBrownAdaptive"))
                .padding(.trailing, 30)
              Text(item)
                .lineLimit(nil)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .frame(minHeight: 100)
            }
          }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
      }
    }
    .edgesIgnoringSafeArea(.all)
    // 浮层 close icon
    .overlay {
      HStack {
        Spacer()
        VStack {
          Button(action: {
            // parent.showModel = false;
            // self.showModel = false;
            self.hideModal.wrappedValue.dismiss();
          }, label: {
            Image(systemName: "chevron.down.circle.fill")
              .font(.title)
              .foregroundColor(.white)
              .shadow(radius: 4)
              .opacity(self.pulsate ? 1 : 0.7)
              .scaleEffect(self.pulsate ? 1.2 : 0.7, anchor: .center)
              .animation(animate, value: UUID())
          })
          .padding(.top, 24)
          .padding(.trailing, 20)
          Spacer()
        }
      }
    }
    .onAppear() {
      self.pulsate.toggle();
    }
  }
}

//struct SnackDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    SnackDetailView()
//  }
//}
