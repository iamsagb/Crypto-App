//
//  LocalFileManager.swift
//  CryptoApp
//
//  Created by Sagar Bhosale on 30/08/23.
//

import Foundation
import SwiftUI


class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {
        
    }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        createFolderIfNeeded(folderName: folderName)
        
        guard let data = image.pngData(),
              let url = getURLForImage(imageName: imageName, folderName: folderName) else {
            return
        }
        
        do {
            try data.write(to: url)

        } catch let error {
            print("Error Saving Image: \(error.localizedDescription)")
        }
    }
    
    public func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error Creating Directory: \(error.localizedDescription)")
            }
        }
    }
    
    private func getURLForFolder(_ folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil
        }
        
        return url.appendingPathComponent(folderName)
        
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName) else { return nil }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    
}
