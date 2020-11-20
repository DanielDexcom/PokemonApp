//
//  UIImage+URL.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/20/20.
//

import Foundation
import UIKit

extension UIImage {
    static func ImageFromURL(url: String) -> UIImage? {
        if let data = try? Data(contentsOf: URL(string: url)!) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }
}
