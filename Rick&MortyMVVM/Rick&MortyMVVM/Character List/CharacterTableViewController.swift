//
//  CharactersTableViewController.swift
//  Rick&MortyMVVM
//
//  Created by Jacob Perez on 10/17/22.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    @IBOutlet weak var characterSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
}
