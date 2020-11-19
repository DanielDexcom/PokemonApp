//
//  PokemonMapper.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/18/20.
//

import Foundation

class PokemonMapper {
    static func mapPokemonDtoToPokemon(pokeDto: PokemonDTO) -> Pokemon {
        let name = pokeDto.name
        let image = pokeDto.sprites?.frontDefault
        let types = pokeDto.types!.map { (type) -> String in
            return (type.type?.name!)!
        }
        let height = pokeDto.height
        let weight = pokeDto.weight
        
        return Pokemon(name: name, images: image, types: types, height: height, weight: weight)
    }
}
