//
//  PokeDexCell.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/20/20.
//

import Foundation
import UIKit

class PokeDexCell: UITableViewCell {
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
