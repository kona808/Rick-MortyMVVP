//
//  CharacterDetailViewController.swift
//  Rick&MortyMVVM
//
//  Created by Jacob Perez on 10/19/22.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func configure( with character: Character, and image: UIImage?) {
        loadViewIfNeeded()
        if let image {
           characterImage.image = image
        }
        idLabel.text = "Character No: \(character.id)"
        nameLabel.text = character.name
        statusLabel.text = "Status: \(character.name)"
        speciesLabel.text = character.species
        locationLabel.text = "Location: \(character.location.name)"
        originLabel.text = "Origin: \(character.origin.name)"
        genderLabel.text = character.gender
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
