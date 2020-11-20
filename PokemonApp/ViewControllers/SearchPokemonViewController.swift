//
//  ViewController.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/17/20.
//

import UIKit


class SearchPokemonViewController: UIViewController {

    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeTextField: UITextField!
    @IBOutlet weak var pokeDataView: PokeDataView!
    
    var pokeApi: PokeApiClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewWillAppear")
        pokeApi = PokeApiFabric.createPokeApiClient()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear")
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidDisappear")
    }

    @IBAction func searchTap(_ sender: Any) {
        self.pokeDataView.loading = true
        pokeApi?.getPokemon(name: pokeTextField.text!, completion: { (pokemon) in
            self.updatePokemonInfo(pokemon: pokemon)
            PokeDbManager.shared.storePokemon(pokemon: pokemon)
        })
    }
    
    func updatePokemonInfo(pokemon: Pokemon) {
        var types = ""
        var image: UIImage?
        
        if let data = try? Data(contentsOf: URL(string: pokemon.images)!) {
            if let pokeImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    image = pokeImage
                }
            }
        }
        
        pokemon.types.forEach { (type) in
            types = types + type.capitalizingFirstLetter() + "\n"
        }
        
        DispatchQueue.main.async {
            self.pokeDataView.text = types
            self.pokeNameLabel.text = pokemon.name
            self.pokeDataView.titleText = "Types"
            self.pokeImageView.image = image
            self.pokeDataView.loading = false
        }
        
    }
    
}

