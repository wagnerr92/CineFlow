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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func tappedActionButton(_ sender: Any) {
        let controller = UIStoryboard(name: "SearchResult", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchResultViewController.self)) as? SearchResultViewController
                    navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
         
    }
    
    @IBAction func tappedAdventureButton(_ sender: Any) {
        let controller = UIStoryboard(name: "SearchResult", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchResultViewController.self)) as? SearchResultViewController
                    navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedAnimationButton(_ sender: Any) {
        let controller = UIStoryboard(name: "SearchResult", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchResultViewController.self)) as? SearchResultViewController
                    navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedComedyButton(_ sender: Any) {
        let controller = UIStoryboard(name: "SearchResult", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchResultViewController.self)) as? SearchResultViewController
                    navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedHorrorButton(_ sender: Any) {
        let controller = UIStoryboard(name: "SearchResult", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchResultViewController.self)) as? SearchResultViewController
                    navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedThrillerButton(_ sender: Any) {
        let controller = UIStoryboard(name: "SearchResult", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchResultViewController.self)) as? SearchResultViewController
                    navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
    }
    @IBAction func tappedRomanceButton(_ sender: Any) {
        let controller = UIStoryboard(name: "SearchResult", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchResultViewController.self)) as? SearchResultViewController
                    navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedDramaButton(_ sender: Any) {
        let controller = UIStoryboard(name: "SearchResult", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchResultViewController.self)) as? SearchResultViewController
                    navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
    }
    
}
