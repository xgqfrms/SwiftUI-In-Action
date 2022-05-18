//
//  DeveloperView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/19.
//

import Foundation

import SwiftUI

// 扩展 subscript 方法
extension String {
  subscript (bounds: CountableClosedRange<Int>) -> String {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return String(self[start...end])
  }

  subscript (bounds: CountableRange<Int>) -> String {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return String(self[start..<end])
  }
}

struct DeveloperView: View {
  var key: String;
  var value: String;
  var isURL: Bool;
  var url: String?
  // 多个匿名参数，如果存在可选的，可能会导致后面的几个匿名参数匹配错误 bug ❌
  init(_ key: String, _ value: String, _ isURL: Bool, _ url: String?) {
    self.key = key;
    self.value = value;
    self.isURL = isURL;
    // nil 异常处理
    self.url = url;
    // self.url = url ?? "";
    // self.url = url!;
  }
  /*
  private func getEncodeURL(_ url: String) -> URL {
    // encode URL with Chinese Unicode
    // 'subscript(_:)' is unavailable: cannot subscript String with an integer range, use a String.Index range instead.
     let path = url[8..<url.count];
     return URL(string: "https://\(path)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!;
  }
  */
  private func getEncodeURL(_ url: String) -> URL {
    // encode URL with Chinese Unicode
    return URL(string: "\(url)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!;
  }
  func getURL(_ url: String) -> URL {
    return URL(string: "\(url)")!;
  }
  var body: some View {
    HStack {
      Text(key)
        .foregroundColor(.gray)
      Spacer()
      if(isURL) {
        HStack {
          // Link("\(key)网址", destination: getEncodeURL(value));
          // Link("\(key)网址", destination: getURL(value));
          // Link("\(key)网址", destination: URL(string: "\(value)")!);
          // Cannot force unwrap value of non-optional type 'String' ❌
          Link("\(key)网址", destination: URL(string: "\(url!)")!);
          Image(systemName: "arrow.up.right.square")
            .foregroundColor(.pink)
        }
        .foregroundColor(.green)
      } else if(value.count != 0) {
        // value != nil
        // Comparing non-optional value of type 'String' to 'nil' always returns true
        Text(value)
          .fontWeight(.bold)
      } else {
        EmptyView();
      }
    }
  }
}

//struct DeveloperView_Previews: PreviewProvider {
//    static var previews: some View {
//        DeveloperView()
//    }
//}
