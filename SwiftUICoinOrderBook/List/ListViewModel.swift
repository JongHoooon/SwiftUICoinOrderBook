//
//  ListVIewModel.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/21/23.
//

import Foundation

final class ListViewModel: ObservableObject {
  
  @Published
  var markets = [
    Market(market: "a", korean: "ㅁ", english: "e")
  ]
  
  func fetchAllMarket() {
    let url = URL(string: "https://api.upbit.com/v1/market/all")!
    URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let data = data
      else {
        print("데이터 응답 없음")
        return
      }
      
      do {
        let decodedData = try JSONDecoder().decode([Market].self, from: data)
        print(decodedData)
      
        DispatchQueue.main.async {
          self?.markets = decodedData
        }
        
      } catch {
        print(error)
      }
    }
    .resume()
  }
}
