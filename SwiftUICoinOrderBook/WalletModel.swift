//
//  WalletModel.swift
//  SwiftUICoinOrderBook
//
//  Created by JongHoon on 11/22/23.
//

import SwiftUI

struct WalletModel: Hashable {
  let color = Color.random()
  let name: String
  let index: Int
}

var walletList = [
  WalletModel(name: "Hue Card", index: 0),
  WalletModel(name: "Jack Card", index: 0),
  WalletModel(name: "Bran Card", index: 0),
  WalletModel(name: "Koko Card", index: 0)
]
