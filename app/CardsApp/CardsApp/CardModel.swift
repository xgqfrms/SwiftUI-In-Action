//
//  CardModel.swift
//  CardsApp
//
//  Created by 夏凌晨 on 2022/5/11.
//

//import Foundation

import SwiftUI

// Type 'Card' does not conform to protocol 'Identifiable'
// Do you want to add protocol stubs?

struct Card: Identifiable {
  // uuid
  var id: UUID = UUID();
  var title: String;
  var headline: String;
  var imageName: String;
  var callToAction: String;
  var message: String;
  var gradientColors: [Color];
}

