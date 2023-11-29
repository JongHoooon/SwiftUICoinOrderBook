//
//  HorizontalView.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/27/23.
//

import SwiftUI

struct HorizontalView: View {
  
  @StateObject
  private var viewModel = HorizontalViewModel()
  
  var body: some View {
    ScrollView {
      Text("\(viewModel.value)")
      GeometryReader { proxy in
        
        let graphWidth = proxy.size.width
        
        VStack   {
          ForEach(horizontalDummy, id: \.id) { item in
            HStack {
              Text(item.data)
                .frame(width: proxy.size.width * 0.2)
              ZStack(alignment: .leading) {
                Rectangle()
                  .foregroundStyle(.blue.opacity(0.3))
                  .frame(width: CGFloat(item.point) / 10.0)
                  .frame(maxWidth: graphWidth * 0.7)
                Text(item.point.formatted())
              }
              .frame(maxWidth: .infinity)
              .background(.gray)
            }
            .frame(height: 40.0)
          }
        }
        .background(.green)
        .onTapGesture {
//          viewModel.time()
          print(proxy)
          print(proxy.size)
        }
      }
    }
  }
}

#Preview {
  HorizontalView()
}
