//
//  IframeWebView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/18.
//

import WebKit;

import SwiftUI;


struct WebKit_WKWebView: UIViewRepresentable {
  var url: String;
  func makeUIView(context: Context) -> WKWebView {
    guard let url = URL(string: self.url) else {
      return WKWebView();
    }
    let request = URLRequest(url: url);
    let webview = WKWebView();
    webview.load(request);
    return webview;
  }
  func updateUIView(_ uiView: WKWebView, context: Context) {
    //
  }
}

struct IframeWebView: View {
  var url: String;
  init(_ str: String) {
    self.url = str;
  }
  var body: some View {
    WebKit_WKWebView(url: url)
      // .edgesIgnoringSafeArea(Edge.Set.top)
      .edgesIgnoringSafeArea(.all)

  }
}

struct IframeWebView_Previews: PreviewProvider {
  static var previews: some View {
    IframeWebView("https://cdn.xgqfrms.xyz")
  }
}


