//
//  HomeTableViewCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/09/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static func nib() -> UINib {
        return UINib(nibName: HomeTableViewCell.reuseId, bundle: nil)
    }

    var covers: [CoverModel] = [
        CoverModel(coverName: "capa1"),
        CoverModel(coverName: "capa2"),
        CoverModel(coverName: "capa3"),
        CoverModel(coverName: "capa4"),
        CoverModel(coverName: "capa5"),
        CoverModel(coverName: "capa6"),
        CoverModel(coverName: "capa7"),
        CoverModel(coverName: "capa8"),
        CoverModel(coverName: "capa9"),
        CoverModel(coverName: "capa10")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addLayout()
    }
}

extension HomeTableViewCell {
    private func addLayout() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .none
        collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.reuseId)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 20
            
        }
    }
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return covers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseId, for: indexPath) as? HomeCollectionViewCell
        if let cell = cell {
            cell.setupCell(data: covers[indexPath.row])
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 100, height: 150)
    }
    
}
