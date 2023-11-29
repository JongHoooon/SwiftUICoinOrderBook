//
//  SeSACView.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/27/23.
//

import SwiftUI

struct SeSACView: View {
  
  @State
  private var textFieldText = "SwiftUI 테스트"
  @State
  private var uiKitTextFieldText = "UIKit 텍스트"
  
  var body: some View {
    VStack {
      TextField("SwiftUI 입니다.", text: $textFieldText)
        .tint(.green)
      VStack {
        Text(uiKitTextFieldText)
        MyTextField(text: $uiKitTextFieldText)
      }
      .background(.gray)
      .padding()
      MyWebView(url: "https://www.apple.com")
        .frame(width: 300.0, height: 400.0)
    }
  }
}

#Preview {
  SeSACView()
}
