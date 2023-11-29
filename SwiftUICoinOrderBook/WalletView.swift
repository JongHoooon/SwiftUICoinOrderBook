//
//  WalletView.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/22/23.
//

import SwiftUI

struct WalletView: View {
  
  @State 
  private var isExpandable = false  // 애니메이션
  @State
  private var showDetail = false    // 다음 화면 전환
  
  private var wallets = walletList
  
  @State
  private var currentWallet = WalletModel(name: "", index: 0)
  
  @Namespace
  var animation
  
  var body: some View {
    VStack {
      topTitle()
      
      cardSpace()
      
      Button("AnimationOn") {
        withAnimation {
          isExpandable = true
        }
      }
      Button("AnimationOff") {
        withAnimation {
          isExpandable = false
        }
      }
    }
    .overlay {
      if showDetail {
        WalletDetailView(
          showDetail: $showDetail,
          currentWallet: currentWallet,
          animation: animation
        )
      }
    }
  }
  
  func topTitle() -> some View {
    Text("RB Wallet")
      .font(.largeTitle)
      .bold()
      .frame(
        maxWidth: .infinity,
        alignment: isExpandable ? .leading : .center
      )
      .overlay(alignment: .trailing) {
        topOverlayButton()
      }
      .padding()
  }
  
  func cardSpace() -> some View {
    ScrollView {
      ForEach(0..<5) { item in
        cardView(WalletModel(name: "", index: item))
          .frame(height: 150.0)
      }
    }
    .background(.red)
    .overlay {
      if isExpandable == false {
        Rectangle()
          .fill(.black.opacity(0.01))
          .onTapGesture {
            withAnimation {
              isExpandable = true
            }
          }
      }
    }
  }
  
  func cardView(_ data: WalletModel) -> some View {
    RoundedRectangle(cornerRadius: 25.0)
      .fill(data.color)
      .frame(height: 150.0)
      .padding(.horizontal)
      .padding(.vertical, 5)
      .offset(y: CGFloat(data.index) * (isExpandable ? 0 : -130))
      .onTapGesture {
        withAnimation { 
          // 카드 탭 시 다음 화면 전환
          currentWallet = data
          showDetail = true
        }
      }
      .matchedGeometryEffect(id: data, in: animation)
  }
  
  func topOverlayButton() -> some View {
    Button {
      
    } label: {
      Image(systemName: "plus")
        .foregroundStyle(.white)
        .padding()
        .background(.black, in: Circle())
    }
    .rotationEffect(.degrees(isExpandable ? 45 : 0))
    .opacity(isExpandable ? 1 : 0)
  }
}

#Preview {
  WalletView()
}
