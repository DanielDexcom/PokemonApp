//
//  PokeClient.swift
//  PokemonApp
//
//  API Documentation: https://pokeapi.co/docs/v2
//
//  Created by Daniel Moreno on 11/18/20.
//

import Foundation


private class PokeApi: PokeApiClient {
    
    let baseUrl = "https://pokeapi.co/api/v2/"
    
    func getPokemon(name: String, completion: @escaping (_ pokemon: Pokemon) -> Void) {
        let pokemonUrl = baseUrl + "pokemon/\(name)"
        if let url = URL(string: pokemonUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    let res = try JSONDecoder().decode(PokemonDTO.self, from: data!)
                    let pokemon = PokemonMapper.mapPokemonDtoToPokemon(pokeDto: res)
                    completion(pokemon)
                } catch let error {
                    print(error)
                }
            }.resume()
        }
    }
    
}

class PokeApiFabric {
    static func createPokeApiClient() -> PokeApiClient {
        return PokeApi()
    }
}

protocol PokeApiClient {
    func getPokemon(name: String, completion: @escaping (_ pokemon: Pokemon) -> Void)
}
