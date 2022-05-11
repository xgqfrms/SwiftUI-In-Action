//
//  CardView.swift
//  CardsApp
//
//  Created by 夏凌晨 on 2022/5/10.
//

import SwiftUI

// 3. UI 组件

// global props
var bool = false;
// 调用 `$bool` 是地址引用
// 调用 `bool` 是值引用

// ❌Property wrappers are not yet supported in top-level code
// @State private var fadeIn: Bool = false;

// 定义变量时候指定类型，colorset 颜色集合
var gradientColors: [Color] = [Color("Color01"), Color("Color02")];

// 从上到下，线性渐变色
let bglColor = LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: UnitPoint.bottom);

// 从左到右，线性渐变色
let bglColor2 = LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing);

let pink: Color = Color.pink;
let dark = Color.black;

//var card: Card = Card(
//  title: "",
//  headline: "",
//  imageName: "",
//  callToAction: "",
//  message: "",
//  gradientColors: [Color("Color01"), Color("Color02")]
//);
// Global 'var' declaration requires an initializer expression or an explicitly stated getter
// var card: Card;
//private var card: Card;

//func getColors(_: _color) -> Color {
//  return LinearGradient(gradient: Gradient(colors: _color), startPoint: .leading, endPoint: .trailing)
//}

// body
struct CardView: View {
    // scoped props / local props
    @State private var fadeIn: Bool = false;
    @State private var moveDownward: Bool = false;
    @State private var moveUpward: Bool = false;
    @State private var showAlert: Bool = false;
    // 触控反馈
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy);
    // 私有属性，局部属性
    var card: Card;
    // function
    // 命名参数
    // labelName 等于 paramName， colors 即是 labelName, colors 也是 paramName (外部参数名称 === 内部参数名称)
    // getColors(colors: colors) ✅
    func getColors(colors: [Color]) -> LinearGradient {
      return LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing);
    }
    // 未命名参数, _ 开头是 labelName, colors 是 paramName
    // getColors2(colors) ✅
    func getColors2(_ colors: [Color]) -> LinearGradient {
      return LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing);
      // '_' can only appear in a pattern or on the left side of an assignment
      // Unnamed parameters must be written with the empty name '_'
    }
    // color 是 labelName, colors 是 paramName (外部参数名称，内部参数名称)
    // getColors3(color: colors) ✅
    func getColors3(color colors: [Color]) -> LinearGradient {
      return LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing);
    }
    var body: some View {
      ZStack {
        // Text("👻")
        // .font(Font.largeTitle)
        // Image("developer-no2");
        Image(card.imageName)
          .opacity(fadeIn ? 1 : 0);
        VStack {
          // Text("SwiftUI")
          Text(card.title)
            .font(Font.largeTitle)
            .fontWeight(.heavy)
            // .foregroundColor(.white)
            .multilineTextAlignment(.center);
          // Text("如此美妙，不同凡响！")
          Text(card.headline)
            // .fontWeight(.light)
            .fontWeight(.medium)
             // .foregroundColor(.white)
             // .foregroundColor(.black)
            .italic();
        }
        .foregroundColor(.white)
        .offset(y: moveDownward ? -218 : -300)
//        Button(
//          action: () -> {
//            print("click button")
//          }, label: () -> {
//            return Text("CTO");
//          }
//        )
        VStack {
          Button(
            action: {
              print("click button");
              // playSound(sound: "sound-transitions", type: "mp3");
              playSound2(sound: "sound-transitions", type: "mp3");
              // 真机测试，才有
              hapticImpact.impactOccurred();
              self.showAlert.toggle();
            },
            label: {
              HStack {
                // Text("CTO")
                Text(card.callToAction)
                  .font(Font.largeTitle)
                  .fontWeight(.heavy)
                  // .foregroundColor(.green)
                  // .accentColor(.white)
                Image(systemName: "arrow.right.circle")
                  .font(Font.largeTitle)
                  // .accentColor(.white)
              }
              // 强调色
              .accentColor(.white)
              .padding(.vertical)
              .padding(.horizontal, 24)
              // .background(bglColor2)
              // .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
              // 命名参数，必须要写参数名称 `colors:`
              // .background(getColors(colors: card.gradientColors))
              // 未命名参数，不需要写参数名称 ✅
              .background(getColors2(card.gradientColors))
              .clipShape(Capsule())
              .shadow(color: Color("ShadowColor"), radius: 6, x: 0, y: 3)
            }
          )
          .offset(y: moveUpward ? 210 : 300)
          // 等价于
//          Button(action: {
//            print("click button")
//          }) {
//            Text("CTO")
//            .font(Font.largeTitle)
//            .fontWeight(.heavy)
//          }
        }
      }
      .frame(width: 335.0, height: 545.0)
      // .background(Color.pink)
      .background(bglColor)
      .cornerRadius(16)
      .shadow(radius: 8)
      // 屏幕后出现执行
      .onAppear() {
        // 闭包
        withAnimation(.linear(duration: 1.2)) {
          self.fadeIn.toggle();
        }
        withAnimation(.linear(duration: 0.8)) {
          self.moveDownward.toggle();
          self.moveUpward.toggle();
        }
      }
      // 有 $ 开头是地址引用，没有是值引用
      .alert(isPresented: $showAlert){
        Alert(
          title: Text(card.title),
          message: Text(card.message),
          dismissButton: .default(Text("关闭"))
        );
      }
    }
}

// just for preview
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        // CardView()
//        CardView(card: CardData[0])
//        .previewLayout(.sizeThatFits);
//        // 指定预览窗口大小与实际布局一致
//    }
//}
