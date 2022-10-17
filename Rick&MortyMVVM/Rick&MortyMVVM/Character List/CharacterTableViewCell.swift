//
//  CharacterTableViewCell.swift
//  Rick&MortyMVVM
//
//  Created by Jacob Perez on 10/17/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageImageView: UIImageView!
    
    @IBOutlet weak var characterNameLabel: UILabel!
    // Helper Func
    func configure(with character: Character) {
        characterNameLabel.text = character.name
        // Fetch the image

    }
    func fetchImage(for character: Character) {
        APIService.fetch(image: character.imageString) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                self.characterImageImageView
            }
        }
    }
}
