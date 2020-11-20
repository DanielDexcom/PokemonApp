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
    var selectedIndex: Int?
    
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
            
            DispatchQueue.main.async {
                cell.pokeImageView.image = UIImage.ImageFromURL(url: pokemon.images)
            }
            
            cell.pokeName.text = pokemon.name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Should perform the segue here, maybe have a member variable to set the selected indexPath
        // so we can know which pokemon send to the DetailViewController
        selectedIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: false)
        self.performSegue(withIdentifier: "pokeDetailSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PokeDetailViewController {
            vc.pokemon = pokemons?[self.selectedIndex ?? 0]
        }
    }
}
