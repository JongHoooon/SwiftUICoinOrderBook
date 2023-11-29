//
//  HorizontalViewModel.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/27/23.
//

import SwiftUI

final class HorizontalViewModel: ObservableObject {
  
  @Published
  var value = 0.0
  
  func time() {
    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
      self.value += 0.5
    })
  }
}
