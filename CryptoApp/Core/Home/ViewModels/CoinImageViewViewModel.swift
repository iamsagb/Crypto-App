//
//  CoinImageViewViewModel.swift
//  CryptoApp
//
//  Created by Sagar Bhosale on 21/08/23.
//

import SwiftUI
import Combine

class CoinImageViewViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private let coin: CoinModel
    private let coinImageservice: CoinImageService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        isLoading = true
        let coinService = CoinImageService(coin: coin)
        self.coinImageservice = coinService
        self.image = coinService.image
        isLoading = false
    }
}
