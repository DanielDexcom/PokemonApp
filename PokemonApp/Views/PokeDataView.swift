//
//  PokeDataView.swift
//  PokemonApp
//
//  Created by Daniel Moreno on 11/19/20.
//

import Foundation
import UIKit

class PokeDataView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textContent: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var text: String? {
        get { return textContent?.text }
        set { textContent.text = newValue }
    }
    
    var titleText: String? {
        get { return title?.text }
        set { title.text = newValue }
    }
    
    var loading: Bool? {
        get { return loadingIndicator.isAnimating }
        set {
            if let value = newValue {
                loadingIndicator.isHidden = !value
                hideAllViews(hide: value)
                if value {
                    loadingIndicator.startAnimating()
                    return
                }
                loadingIndicator.stopAnimating()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    func initViews() {
        let nib = UINib(nibName: "PokeDataView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        loadingIndicator.isHidden = true
    }
    
    func hideAllViews(hide: Bool) {
        title.isHidden = hide
        textContent.isHidden = hide
    }

}
