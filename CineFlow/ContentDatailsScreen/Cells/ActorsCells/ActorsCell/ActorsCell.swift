//
//  ActoresCell.swift
//  CineFlow
//
//  Created by Eduardo on 16/09/24.
//

import UIKit

class ActorsCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static var identifier: String = String(describing: ActorsCell.self)
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var listActor:[String] = []
    var listNameActor:[String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
        configElements()
    }
    
    func configCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ActorsCollectionViewCell.nib(), forCellWithReuseIdentifier: ActorsCollectionViewCell.identifier)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            collectionView.backgroundColor = .black
            collectionView.showsHorizontalScrollIndicator = false
        }
    }
    
    func configElements(){
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.backgroundColor = .black
        }
    
    func setupCell(data: Actors){
       self.listActor = data.image
        self.titleLabel.text = data.title
    }
}

extension ActorsCell: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listActor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorsCollectionViewCell.identifier, for: indexPath) as? ActorsCollectionViewCell
        cell?.setupCell(nameImage: listActor[indexPath.row], nameLabel: listActor[indexPath.row])
       return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: 120, height: 200)
    }
}
