//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Sagar Bhosale on 08/08/23.
//

import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
