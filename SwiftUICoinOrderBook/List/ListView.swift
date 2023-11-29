//
//  ListView.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/21/23.
//

import SwiftUI

struct ListView: View {
  
  // StateObject VS ObservedObject
  // state -> 유지, 상위뷰가 렌더링돼도 데이터 유지된다 / 인스턴스 생성, 재사용
  // observed -> 초기화, 상위뷰안에 하위뷰들이 다 새로 그려짐 / 인스턴스 생성, 초기화
  @ObservedObject
  var viewModel = ListViewModel()
  
  init() {
    print("== init!!")
  }
  
  var body: some View {
      LazyVStack {
        
        Button("서버 통신") {
          viewModel.fetchAllMarket()
        }
        
        ForEach(viewModel.markets, id: \.self) { item in
          HStack {
            VStack(alignment: .center) {
              Text(item.korean)
                .fontWeight(.bold)
              Text(item.english)
                .font(.caption)
                .foregroundStyle(.gray)
            }
            Spacer()
            Text(item.market)
          }
          .padding(16.0)
        }
      }
    .onAppear {
//      viewModel.fetchAllMarket()
    }
  }
}

#Preview {
  ListView()
}
