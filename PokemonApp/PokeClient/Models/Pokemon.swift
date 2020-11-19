//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/18/20.
//

import Foundation
import UIKit

struct Pokemon {

    let name: String
    let images: String
    let height: Int
    let weight: Int
    let types: [String]
    
    init(name: String?, images: String?, types: [String], height: Int?, weight: Int?) {
        self.name = name ?? ""
        self.images = images ?? ""
        self.types = types 
        self.height = height ?? 0
        self.weight = weight ?? 0
    }
    


}



