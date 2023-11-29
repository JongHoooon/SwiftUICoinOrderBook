//
//  BannerTestView.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/21/23.
//

import SwiftUI

struct BannerTestView: View {
  
  @Binding
  var testNumber: Int
  
  var body: some View {
    VStack(spacing: 16.0) {
      Text("테스트: \(testNumber)")
      Button("숫자 없데이트") {
        testNumber = Int.random(in: 1...100)
      }
    }
  }
}

#Preview {
  BannerTestView(testNumber: .constant(5))
}
