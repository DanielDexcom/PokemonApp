//
//  String+Capitalize.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/19/20.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
    
    static func stringFromArrayWihtBreakLine(strings: [String]) -> String {
        var string = ""
        strings.forEach { (str) in
            let localString = str.capitalizingFirstLetter()
            string.append(localString + "\n")
        }
        return string
    }
}
