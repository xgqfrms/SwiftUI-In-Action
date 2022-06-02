//
//  WikiLinkView.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/3.
//

import SwiftUI

struct WikiLinkView: View {
  var url: String;
  var name: String;
  var link: URL;
  init(_ url: String, _ name: String) {
    self.url = url;
    self.name = name;
    link = URL(string: url) ?? URL(string: "https://zh.wikipedia.org/wiki/")!;
  }
  var body: some View {
    // Text("🇨🇳 \(url)")
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("维基百科")
        Spacer()
        Group {
          Link(
            name,
            destination: link
          )
          Image(systemName: "arrow.up.right.square")
        }
      }
    }
  }
}

struct MapModalView_Previews: PreviewProvider {
  static var previews: some View {
    WikiLinkView("https://cdn.xgqfrms.xyz/geolocation-api/index.html", "geo api demo")
  }
}
