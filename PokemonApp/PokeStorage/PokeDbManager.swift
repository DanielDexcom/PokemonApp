//
//  PokeDbManager.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/19/20.
//

import Foundation

class PokeDbManager {
    
    let shared = PokeDbManager()

    private var pokemons: [Pokemon]
    
    private init() {
        self.pokemons = []
    }
    
    
    func storePokemon(pokemon: Pokemon) {
        self.pokemons.append(pokemon)
    }
    
    func fetchPokemons() -> [Pokemon] {
        return pokemons
    }
    
}
