//
//  GenreSearchViewController.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 19/09/24.
//

import UIKit

class GenreSearchViewController: UIViewController {

    @IBOutlet weak var genresView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = CFColor.backgroundDefault
        
        genresView.backgroundColor = CFColor.genresViewBackground

    }
    
    
    @IBAction func tappedActionButton(_ sender: Any) {
    }
    
    @IBAction func tappedAdventureButton(_ sender: Any) {
    }
    
    @IBAction func tappedAnimationButton(_ sender: Any) {
    }
    
    @IBAction func tappedComedyButton(_ sender: Any) {
    }
    
    @IBAction func tappedHorrorButton(_ sender: Any) {
    }
    
    @IBAction func tappedThrillerButton(_ sender: Any) {
    }
    @IBAction func tappedRomanceButton(_ sender: Any) {
    }
    
    @IBAction func tappedDramaButton(_ sender: Any) {
    }
    
}
