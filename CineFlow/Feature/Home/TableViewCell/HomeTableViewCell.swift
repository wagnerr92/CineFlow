//
//  HomeTableViewCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/09/24.
//

import UIKit

protocol HomeTableViewCellDelegate: AnyObject {
    func goToDetail(sinopse: String, title: String, cover: String)
    func getMovies(indexPath: IndexPath) -> MovieSerieModel
    func numberOfItemsInSection(section: Int) -> Int
}

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: HomeTableViewCellDelegate?
    
    static func nib() -> UINib {
        return UINib(nibName: HomeTableViewCell.reuseId, bundle: nil)
    }
    
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
        let count = self.delegate?.numberOfItemsInSection(section: section) ?? 0
        return count//self.delegate?.numberOfItemsInSection(section: section) ?? 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseId, for: indexPath) as? HomeCollectionViewCell
//        if let cell = cell {
//            cell.setupCell(data: self.delegate?.getMovies(indexPath: indexPath))
//        }
//        return cell ?? UICollectionViewCell()
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseId, for: indexPath) as? HomeCollectionViewCell
//        if let movie = self.delegate?.getMovies(indexPath: indexPath) {
//            print("Configurando célula com filme: \(movie.title)")
//            cell?.setupCell(data: movie)
//        } else {
//            print("Erro: Nenhum filme retornado para indexPath \(indexPath.row)")
//        }
//        return cell ?? UICollectionViewCell()
//    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseId, for: indexPath) as? HomeCollectionViewCell
        if let movie = self.delegate?.getMovies(indexPath: indexPath) {
            cell?.setupCell(data: movie)
        } else {
            print("Erro: Nenhum filme retornado para indexPath \(indexPath.row)")
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 100, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = self.delegate?.getMovies(indexPath: indexPath).title ?? ""
        let sinopse = self.delegate?.getMovies(indexPath: indexPath).overview ?? "" 
        let coverImage = self.delegate?.getMovies(indexPath: indexPath).backdropPath ?? ""
        self.delegate?.goToDetail(sinopse: sinopse, title: title, cover: coverImage)
    }

}
