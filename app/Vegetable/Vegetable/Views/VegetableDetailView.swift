//
//  VegetableDetailView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/18.
//

import SwiftUI

struct VegetableDetailView: View {
  var vegetable: VegetableModel;
  init(_ vegetable: VegetableModel) {
    self.vegetable = vegetable;
  }
  var body: some View {
    Text("蔬菜详情页面")
  }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VegetableDetailView(VegetableData[0])
    }
}
