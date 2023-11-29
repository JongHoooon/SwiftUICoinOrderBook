//
//  MyTextField.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/27/23.
//

import SwiftUI

// SwiftUI -> UIkit

struct MyTextField: UIViewRepresentable {
  
  @Binding 
  var text: String
  
  func makeUIView(context: Context) -> UITextField {
    let view = UITextField()
    view.borderStyle = .none
    view.keyboardType = .numberPad
    view.tintColor = .red
    view.font = .boldSystemFont(ofSize: 20.0)
    view.textAlignment = .center
    view.placeholder = "플레이스 홀더"
    view.text = "텍스트 필드!!"
    view.text = text
//    view.delegate = context
    return view
  }
  
  func updateUIView(_ uiView: UITextField, context: Context) {
    uiView.text = text
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(text: $text)
  }
  
  // UIKit -> SwiftUI
  class Coordinator: NSObject, UITextFieldDelegate {
    
    @Binding
    var text: String
    
    init(text: Binding<String>) {
      self._text = text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      text = textField.text ?? ""
      return true
    }
  }
}
