//
//  PopulateTableViewCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 30/10/24.
//

import UIKit

protocol PopulateTableViewCellDelegate: AnyObject {
    func goToDetailbyPopulate(sinopse: String, title: String, cover: String)
    func getPopulateMovies(indexPath: IndexPath) -> MovieSerieModel
    func populateNumberOfItemsInSection(section: Int) -> Int
}

class PopulateTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: PopulateTableViewCellDelegate?
    
    static func nib() -> UINib {
        return UINib(nibName: PopulateTableViewCell.reuseId, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addLayout()
    }
}

extension PopulateTableViewCell {
    private func addLayout() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .none
        collectionView.register(PopulateCollectionViewCell.nib(), forCellWithReuseIdentifier: PopulateCollectionViewCell.reuseId)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 20
            
        }
    }
}

extension PopulateTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.delegate?.populateNumberOfItemsInSection(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopulateCollectionViewCell.reuseId, for: indexPath) as? PopulateCollectionViewCell
        if let cell = cell {
            cell.setupCell(data: self.delegate?.getPopulateMovies(indexPath: indexPath))
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 100, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = self.delegate?.getPopulateMovies(indexPath: indexPath).title ?? ""
        let sinopse = self.delegate?.getPopulateMovies(indexPath: indexPath).sinopse ?? ""
        let coverImage = self.delegate?.getPopulateMovies(indexPath: indexPath).coverImage ?? ""
        self.delegate?.goToDetailbyPopulate(sinopse: sinopse, title: title, cover: coverImage)
    }
}
