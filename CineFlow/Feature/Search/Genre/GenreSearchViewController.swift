//
//  GenreSearchViewController.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 19/09/24.
//

import UIKit

class GenreSearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var listGenre: [Genre] = [
        Genre(id: nil, name: "Action", image: UIImage(systemName: "flame")),Genre(id: nil, name: "Adventure", image: UIImage(systemName: "paperplane")),Genre(id: nil, name: "Animation", image: UIImage(systemName: "film")),Genre(id: nil, name: "Comedy", image: UIImage(systemName: "smiley")),Genre(id: nil, name: "Crime", image: UIImage(systemName: "hand.raised")),Genre(id: nil, name: "Documentary", image: UIImage(systemName: "book")),Genre(id: nil, name: "Drama", image: UIImage(systemName: "theatermasks")),Genre(id: nil, name: "Family", image: UIImage(systemName: "house")),Genre(id: nil, name: "Fantasy", image: UIImage(systemName: "sparkles")),Genre(id: nil, name: "History", image: UIImage(systemName: "clock")),Genre(id: nil, name: "Horror", image: UIImage(systemName: "eye")),Genre(id: nil, name: "Music", image: UIImage(systemName: "music.note")),Genre(id: nil, name: "Mystery", image: UIImage(systemName: "questionmark.circle")),Genre(id: nil, name: "Romance", image: UIImage(systemName: "heart")),Genre(id: nil, name: "Science Fiction", image: UIImage(systemName: "atom")),Genre(id: nil, name: "TV Movie", image: UIImage(systemName: "tv")),Genre(id: nil, name: "Thriller", image: UIImage(systemName: "bolt")),Genre(id: nil, name: "War", image: UIImage(systemName: "shield")),Genre(id: nil, name: "Western", image: UIImage(systemName: "sunset"))
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = CFColor.backgroundDefault
        configCollectionView()
    }
    
    func configCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GenreCell.nib(), forCellWithReuseIdentifier: GenreCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let itemWidth = (view.frame.width - 100) / 2
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.collectionViewLayout = layout
    }
}

extension GenreSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listGenre.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCell.identifier, for: indexPath) as? GenreCell
        cell?.setupCell(data: listGenre[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}
