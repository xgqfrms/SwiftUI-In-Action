//
//  DeveloperView.swift
//  Vegetable
//
//  Created by 夏凌晨 on 2022/5/19.
//

import SwiftUI

struct DeveloperView: View {
  var key: String;
  var value: String;
  var isURL: Bool?;
  init(_ key: String, _ value: String, _ isURL: Bool) {
    self.key = key;
    self.value = value;
    if(isURL) {
      self.isURL = isURL;
    }
  }
  private func getEncodeURL(_ url: String) -> URL {
    // encode URL with Chinese Unicode
    return URL(string: "\(url)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!;
  }
  var body: some View {
    HStack {
      Text(key)
        .foregroundColor(.gray)
      Spacer()
      if(isURL ?? false) {
        HStack {
          Link("\(key)网址", destination: getEncodeURL(value));
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
