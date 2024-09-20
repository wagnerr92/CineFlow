//
//  DetailListViewController.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 23/08/24.
//

import UIKit

class DetailListViewController: UIViewController {
    
    var listName = String()
    var numberIndex = Int()
    @IBOutlet weak var listTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTitle.text = listName
        addLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func deleteList(_ sender: UIBarButtonItem) {
         showSimpleAlert(title: "Atenção",
                         message: "Deseja realmente excluir a lista \(self.listName)?",
                         customTitle: "Sim",
                         customHandler: { _ in
             Helper.shared.nameListed.remove(at: self.numberIndex)
             self.navigationController?.popViewController(animated: true)
         }, cancelTitle: "Não")
    }
}

extension DetailListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Helper.shared.nameListed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailListCollectionViewCell.reuseId, for: indexPath)
        
        if let cell = cell as? DetailListCollectionViewCell {
            cell.backgroundColor = .red
            cell.itemTitle.text = Helper.shared.nameListed[indexPath.row]
        }
        return cell
    }
}

extension DetailListViewController {
    private func addLayout() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.layer.cornerRadius = 10
        self.collectionView.register(DetailListCollectionViewCell.self, forCellWithReuseIdentifier: DetailListCollectionViewCell.reuseId)
    }
}
