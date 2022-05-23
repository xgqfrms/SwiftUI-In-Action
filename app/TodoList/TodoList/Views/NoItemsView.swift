//
//  NoItemsView.swift
//  TodoList
//
//  Created by 夏凌晨 on 2022/5/20.
//

import SwiftUI

struct NoItemsView: View {
  @State private var animate: Bool = false;
  private let SecondAccentColor = Color("SecondAccentColor");
  func autoAnimate() {
    // delay 1.5s
    DispatchQueue.main.asyncAfter(
      deadline: .now() + 1.5,
      execute: {
        guard !animate else {
          return;
        }
        /*
        withAnimation(
          Animation
            .easeInOut(duration: 2)
            .repeatForever(),
          {
            animate.toggle();
          }
        )
        */
        withAnimation(
          Animation
            .easeInOut(duration: 2)
            .repeatForever()
        ) {
          animate.toggle();
        }
      }
    )
  }
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        Text("NoItem")
          .font(.largeTitle)
        Text("NoItemDesc")
        NavigationLink(
          destination: AddItemView(),
          label: {
            Text("GoToAdd")
              .font(.headline)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .foregroundColor(.white)
              .background(animate ? .accentColor : SecondAccentColor)
              .cornerRadius(10)
              .padding(.horizontal, animate ? 30 : 50)
              .scaleEffect(animate ? 1.1 : 1.0)
              .offset(y: animate ? 20 : 10)
              .shadow(
                color: animate ? .accentColor.opacity(0.7) : SecondAccentColor.opacity(0.3),
                radius: animate ? 20 : 10,
                x: 0,
                y: animate ? 20 : 30)
          }
        )
      }
      .multilineTextAlignment(.center)
      .padding(40)
      .onAppear(perform: autoAnimate)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

struct NoItemsView_Previews: PreviewProvider {
  static var previews: some View {
    NoItemsView()
  }
}
