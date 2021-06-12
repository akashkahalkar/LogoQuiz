//
//  ImageCache.swift
//  LogoQuiz
//
//  Created by akash.kahalkar on 12/06/21.
//

import Foundation
import UIKit



//due to time limitation the multithreading part is not handled while writing the dictionary
class ImageCache {
    static let shared = ImageCache()
    
    let session = URLSession.shared
    
    private var cache: [String: UIImage] = [:]
    
    func getImage(for url: String, completion: (UIImage?)-> Void) {
        if let image = cache[url] {
            completion(image)
        } else {
            //with less time this is the fasted way i was able to get image without boilerplate
            if let image = UIImage(contentsOfFile: url) {
                cache[url] = image
                completion(image)
            }
            completion(nil)
        }
    }
}
