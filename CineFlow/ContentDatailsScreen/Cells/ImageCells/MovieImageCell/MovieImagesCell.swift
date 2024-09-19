//
//  MovieImagesCell.swift
//  CineFlow
//
//  Created by Eduardo on 16/09/24.
//

import UIKit

class MovieImagesCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var identifier: String = String(describing: MovieImagesCell.self)
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var listImage: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollection()
        configElements()
    }

    func configCollection(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieImageCollectionCell.nib(), forCellWithReuseIdentifier: MovieImageCollectionCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            collectionView.backgroundColor = .black
        }
    }
    
    func configElements(){
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.backgroundColor = .black
        }
    
    func setupCell(data: Photos){
        self.listImage = data.image
        self.titleLabel.text = data.title
    }
}

extension MovieImagesCell: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieImageCollectionCell.identifier, for: indexPath) as? MovieImageCollectionCell
        cell?.setupCell(nameImage: listImage[indexPath.row])

       return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: 120, height: 200)
    }
}
