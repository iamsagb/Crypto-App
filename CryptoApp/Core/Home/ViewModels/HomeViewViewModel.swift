//
//  HomeViewViewModel.swift
//  CryptoApp
//
//  Created by Sagar Bhosale on 21/08/23.
//

import Combine
import Foundation


class HomeViewViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubscribers()
        
    }
    
    func addSubscribers(){
        dataService.$allCoins
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
    }
    
    
     
}
