//
//  PokeDexViewController.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/20/20.
//

import Foundation
import UIKit

class PokeDexViewController: UITableViewController {
    
    var pokemons: [Pokemon]?
    
    override func viewWillAppear(_ animated: Bool) {
        pokemons = PokeDbManager.shared.fetchPokemons()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokeCell") as! PokeDexCell
        if let pokemon = pokemons?[indexPath.row] {
            
            if let data = try? Data(contentsOf: URL(string: pokemon.images)!) {
                if let pokeImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.pokeImageView.image = pokeImage
                    }
                }
            }

            
            cell.pokeName.text = pokemon.name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Should perform the segue here, maybe have a member variable to set the selected indexPath
        // so we can know which pokemon send to the DetailViewController
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        // Perform segue and instantiate the target VC using the sender to pass data
    }
}
