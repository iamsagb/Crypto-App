//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Sagar Bhosale on 08/08/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
