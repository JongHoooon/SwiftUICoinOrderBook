//
//  ContentView.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/20/23.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject
  var viewModel = ContentViewModel()
  
  @State
  var renderingTestNumber = 0
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          
          Text("테스트: \(renderingTestNumber)")
          
          NavigationLink("배너 테스트", value: renderingTestNumber)
          
          ScrollView(.horizontal) {
            LazyHStack {
              ForEach(1..<5) { data in
                bannerView()
                  .containerRelativeFrame(.horizontal)
                  .onTapGesture {
                    viewModel.fetchBanner()
                  }
              }
            }
            // 스크롤 하고자 하는 대상에 대한 레이아웃 설정
            .scrollTargetLayout()
          }
          .scrollTargetBehavior(.viewAligned)
          
          //          .safeAreaPadding([.horizontal], 40.0)
//          LazyVStack {
//            ForEach(viewModel.markets, id: \.self) { data in
//              listView(data: data)
//            }
//          }
          
          ListView()
        }
      }
      .scrollIndicators(.hidden)
      .refreshable { // iOS 15
//        viewModel.fetchBanner()
        renderingTestNumber = Int.random(in: 1...100)
      }
      
      .navigationTitle("My Wallet")
      .navigationDestination(
        for: Int.self) { _ in
          BannerTestView(testNumber: $renderingTestNumber)
        }
    }
  }
  
  func bannerView() -> some View {
    ZStack {
      Rectangle()
        .fill(viewModel.banner.color)
        .overlay {
          Circle()
            .fill(.white.opacity(0.3))
            .offset(x: -90.0, y: -20.0)
            .scaleEffect(1.3, anchor: .topLeading)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .frame(maxWidth: .infinity)
        .frame(height: 200.0)
      
      VStack(alignment: .leading) {
        Spacer()
        Text("나의 소비내역")
          .font(.title3)
        Text(viewModel.banner.totalFormat)
          .font(.title)
          .bold()
      }
//      .visualEffect { content, geometryProxy in
//        content.offset(x: scrollOffset(geometryProxy))
//      }
      .padding(.vertical)
      .frame(maxWidth: .infinity, alignment: .bottomLeading)
    }
    .padding()
  }
  
  // GeometryProxy: 컨테이너 뷰에 대한 좌표나 크기에 접근할 수 있음!!
  func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
    let result = proxy.bounds(of: .scrollView)?.minX ?? 0
    return -result
  }
  
//  func listView(data: Market) -> some View {
//    HStack {
//      VStack {
//        Text(data.market)
//        Text(data.korean)
//      }
//      Spacer()
//      Text("KRW-BTC")
//    }
//    .padding(.horizontal, 20.0)
//    .padding(.vertical, 8.0)
//  }
}

#Preview {
  ContentView()
}
