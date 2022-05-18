//
//  OutLinkView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/18.
//

import Foundation

import SwiftUI

struct OutLinkView: View {
  var vegetable: VegetableModel;
  init(_ vegetable: VegetableModel) {
    self.vegetable = vegetable;
  }
  func getEncodeURL(_ str: String) -> URL {
    // encode URL with Chinese Unicode
    return URL(string: "https://zh.wikipedia.org/wiki/\(str)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!;
    // return URL(string: "https://zh.wikipedia.org/wiki/\(str)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) ?? "https://zh.wikipedia.org/wiki/";
  }
  func getEncodeURI(_ str: String) -> URL {
    // encode URL with Chinese Unicode
    let domain = "https://zh.wikipedia.org"
    let path = "/wiki/\(str)"
    var urlcomps = URLComponents(string: domain)!
    urlcomps.path = path;
    let url = urlcomps.url!
    print("✅ encode unicode URL = \(url)");
    return url;
    // Cannot convert return expression of type 'URL' to return type 'String'
  }
  func getEncodeString(_ str: String) -> String {
    // encode URL with Chinese Unicode
    return str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!;
    // return str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "https://zh.wikipedia.org/wiki/";
    /*
     return str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed);
     Value of optional type 'String?' must be unwrapped to a value of type 'String'
     Coalesce using '??' to provide a default when the optional value contains 'nil'
     Force-unwrap using '!' to abort execution if the optional value contains 'nil'
     */
  }
  var body: some View {
    GroupBox {
      HStack {
        Text("数据来源")
        Spacer()
        // Link("维基百科-\(vegetable.title)", destination: getEncodeURL(vegetable.title))
        Link("维基百科-\(vegetable.title)", destination: getEncodeURI(vegetable.title))
        // Link(Text("维基百科-\(vegetable.title)"), destination: getEncodeURI(vegetable.title))
        // ??? Link 文字如何添加颜色
        // ❌ Initializer 'init(_:destination:)' requires that 'Text' conform to 'StringProtocol'
        // Link("维基百科", destination: URL(string: getEncodeString(vegetable.title) ?? vegetable.title!)
        // ❌ cannot force unwrap value of non-optional type 'String'
        // Link("维基百科", destination: URL(string: "https://zh.wikipedia.org/wiki/\(vegetable.title)")!)
        // Link("维基百科", destination: URL(string: "https://zh.wikipedia.org/wiki/黄瓜")!)
        // Link("维基百科", destination: URL(string: "https://zh.wikipedia.org/wiki/%E9%BB%84%E7%93%9C")!)
        Image(systemName: "arrow.up.right.square")
      }
    }
  }
}

struct OutLinkView_Previews: PreviewProvider {
  static var previews: some View {
    OutLinkView(VegetableData[0])
      .previewLayout(.sizeThatFits)
  }
}
