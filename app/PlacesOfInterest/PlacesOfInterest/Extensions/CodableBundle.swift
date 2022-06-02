//
//  CodableBundle.swift
//  PlacesOfInterest
//
//  Created by 夏凌晨 on 2022/6/2.
//

import Foundation

// 扩展原有的 Bundle ✅
extension Bundle {
  // 解析 json 文件, T 泛型
  func decode<T: Decodable>(_ fileName: String) -> T {
    // 1. 加载本地 json 文件
    guard let url = self.url(forResource: fileName, withExtension: nil) else {
      let error = "加载本地 json 文件 ❌, fileName: \(fileName)";
      print(error)
      fatalError(error)
    }
    // 2. 读取数据
    guard let data = try? Data(contentsOf: url) else {
      let error = "读取数据 ❌, fileName: \(fileName)";
      print(error)
      fatalError(error)
    }
    // 3. 解析 JSON 数据
    let decoder = JSONDecoder();
    guard let json = try? decoder.decode(T.self, from: data) else {
      let error = "解析 JSON 数据 ❌, fileName: \(fileName)";
      print(error)
      fatalError(error)
    }
    return json;
  }
}

/*
// 扩展原有的 Bundle ✅
extension Bundle {
  // Extensions must not contain stored properties
  // private let step1Error = "加载本地 json 文件 ❌";
  // 解析 json 文件
  func decodeDemo(_ fileName: String) -> [CoverModel] {
    // 1. 加载本地 json 文件
    guard let url = self.url(forResource: fileName, withExtension: nil) else {
      let error = "加载本地 json 文件 ❌, fileName: \(fileName)";
      print(error)
      fatalError(error)
    }
    // 2. 读取数据
    guard let data = try? Data(contentsOf: url) else {
      let error = "读取数据 ❌, fileName: \(fileName)";
      print(error)
      fatalError(error)
    }
    // 3. 解析 JSON 数据
    let decoder = JSONDecoder();
    guard let json = try? decoder.decode([CoverModel].self, from: data) else {
      let error = "解析 JSON 数据 ❌, fileName: \(fileName)";
      print(error)
      fatalError(error)
    }
    return json;
  }
}

 */
