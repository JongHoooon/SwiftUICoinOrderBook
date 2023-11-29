//
//  WalletDetailView.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/22/23.
//

import SwiftUI

struct WalletDetailView: View {
  
  @Binding var showDetail: Bool // 화면 dismiss
  
  let currentWallet: WalletModel // WalletView 에서 선택한 card 정보
  
  // 동일한 그룹임을 인식
  var animation: Namespace.ID
  
  var body: some View {
    Color.gray.ignoresSafeArea()
    ZStack {
      VStack {
        RoundedRectangle(cornerRadius: 25.0)
          .fill(currentWallet.color)
          .frame(height: 150.0)
          .padding(.horizontal)
          .padding(.vertical, 5)
          .onTapGesture { showDetail = false }
          .matchedGeometryEffect(id: currentWallet.index, in: animation)
        Text("Hello, World!")
        Spacer()
      }
    }
  }
}
