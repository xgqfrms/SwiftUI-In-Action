//
//  HuTongView.swift
//  BeiJingTourth
//
//  Created by 夏凌晨 on 2022/5/13.
//

import SwiftUI

struct HuTongView: View {
  let hutongs: [HutongModel] = HutongData;
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack() {
        Spacer();
        HStack(alignment: .center, spacing: 25) {
          /*
           ForEach(hutongs) { item in
           // HutongRanking(hutong: item);
           HutongRanking(item);
           }
           */
          ForEach(hutongs) { hutong in
            HutongRanking(hutong);
          }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        Spacer();
      }
    }
    .edgesIgnoringSafeArea(.all);
  }
}

//struct HuTongView_Previews: PreviewProvider {
//    static var previews: some View {
//        HuTongView()
//    }
//}
