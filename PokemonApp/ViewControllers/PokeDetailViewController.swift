//
//  ViewController.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/17/20.
//

import UIKit


class PokeDetailViewController: UIViewController {

    var pokemon: Pokemon?
    
    @IBOutlet weak var pokeTypeDatView: PokeDataView!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeAbilitiesDataView: PokeDataView!
    @IBOutlet weak var pokeWeightDataView: PokeDataView!
    @IBOutlet weak var pokeHeightDataView: PokeDataView!
    @IBOutlet weak var gamesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewWillAppear")
        updateViews()
    }
    
    func updateViews() {
        if let pokemon = self.pokemon {
            pokeImageView.image = UIImage.ImageFromURL(url: pokemon.images)
            pokeTypeDatView.titleText = "Types"
            pokeTypeDatView.text = String.stringFromArrayWihtBreakLine(strings: pokemon.types)
            pokeAbilitiesDataView.titleText = "Abilities"
            pokeAbilitiesDataView.text = String.stringFromArrayWihtBreakLine(strings: pokemon.abilities)
            pokeWeightDataView.titleText = "Weight"
            pokeWeightDataView.text = String(pokemon.weight)
            pokeHeightDataView.titleText = "Height"
            pokeHeightDataView.text = String(pokemon.height)
            gamesTextView.text = String.stringFromArrayWihtBreakLine(strings: pokemon.games)
            
        }
    }
        
    
}

