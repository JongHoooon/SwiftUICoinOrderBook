//
//  OvserlayView.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/21/23.
//

import SwiftUI

struct OvserlayView: View {
  var body: some View {
    VStack {
      ZStack {
        Circle()
          .fill(.yellow)
          .overlay {
            Circle()
          }
          .frame(width: 150.0, height: 150.0)
          .frame(height: 200.0)
        Text("안녕하세요")
      }
      
      Circle()
        .fill(.yellow)
        .frame(width: 150.0, height: 150.0)
        .overlay {
          Text("안녕하세요 반갑습니다 안녕히가세요")
        }
      
    }
  }
}

#Preview {
  OvserlayView()
}
