//
//  CircleButtonAnimationView.swift
//  CryptoApp
//
//  Created by Sagar Bhosale on 16/08/23.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 2.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
        
    }
}
