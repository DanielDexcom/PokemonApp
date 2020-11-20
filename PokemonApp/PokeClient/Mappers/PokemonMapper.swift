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
            return (type.type?.name! ?? "")
        }
        let height = pokeDto.height
        let weight = pokeDto.weight
        let id = pokeDto.id ?? 0
        let games = pokeDto.gameIndices!.map { (gameIndex) -> String in
            return (gameIndex.version?.name! ?? "")
        }
        
        return Pokemon(id: id, name: name, images: image, types: types, height: height, weight: weight, games: games)
    }
}
