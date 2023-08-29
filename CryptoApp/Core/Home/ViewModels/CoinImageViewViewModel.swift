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
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.downloadImage()
    }
    
    private func downloadImage() {
        isLoading = true
        guard let url = URL(string: coin.image) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { data, _ in UIImage(data: data) }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    // Handle download error
                    print("Image download error: \(error)")
                    self?.isLoading = false
                }
            }, receiveValue: { [weak self] image in
                self?.image = image
            })
            .store(in: &cancellables)
    }
}
