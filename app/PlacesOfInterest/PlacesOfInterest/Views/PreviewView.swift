//
//  PreviewView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import SwiftUI

struct PreviewView: View {
  var body: some View {
    NavigationView {
      List {
        CoversView()
          .frame(height: 300)
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
      }
    }
  }
}

//struct PreviewView_Previews: PreviewProvider {
//  static var previews: some View {
//    PreviewView()
//  }
//}
