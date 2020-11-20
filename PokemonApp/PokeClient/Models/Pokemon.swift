//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/18/20.
//

import Foundation
import UIKit
import CoreData

struct Pokemon {

    let id: Int
    let name: String
    let images: String
    let height: Int
    let weight: Int
    let types: [String]
    let games: [String]
    
    init(id: Int?, name: String?, images: String?, types: [String], height: Int?, weight: Int?, games: [String]?) {
        self.name = name?.capitalizingFirstLetter() ?? ""
        self.images = images ?? ""
        self.types = types 
        self.height = height ?? 0
        self.weight = weight ?? 0
        self.id = id ?? 0
        self.games = games ?? []
    }
    


}



