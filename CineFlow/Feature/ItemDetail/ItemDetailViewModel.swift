//
//  ItemDetailViewModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 23/10/24.
//

import UIKit

final class ItemDetailViewModel {

    var sinopse: [MovieDescription] = []
    
    var list: [Details] = []
    
    var listPhotos: [Photos] = [Photos(title: "Fotos", image: ["deadpool", "deadpool1", "deadpool2", "deadpool3","deadpool", "deadpool1", "deadpool2", "deadpool3","deadpool", "deadpool1", "deadpool2", "deadpool3",])]
    
    var detailsActors: [Actors] = [Actors(title: "Elenco", name: ["Ryan Reynolds","Wesley Snipes ", "Morena Baccarin", "Leslie Uggams", "HughJackman", "Emma Corrin", "Dafne Keen", "Channing Tatum ", "Brianna Hildebrand"], image: ["Ryan Reynolds","Wesley Snipes ", "Morena Baccarin", "Leslie Uggams", "HughJackman", "Emma Corrin", "Dafne Keen", "Channing Tatum ", "Brianna Hildebrand"])]
}

//MARK: Gets
extension ItemDetailViewModel {
    public func numberOfRowsInSection() -> Int {
        return sinopse.count
    }
    
    public func getList(indexPath: IndexPath) -> Details {
        return list[indexPath.row]
    }
    
    public func getSinopse(indexPath: IndexPath) -> MovieDescription {
        return sinopse[indexPath.row - 1]
    }
    
    public func getListPhotos(indexPath: IndexPath) -> Photos {
        return listPhotos[indexPath.row - 2]
    }
    
    public func getDetailsActors(indexPath: IndexPath) -> Actors {
        return detailsActors[indexPath.row - 3]
    }
}

//MARK: Sets
extension ItemDetailViewModel {
    public func setSinopse(sinopse: MovieDescription) {
        self.sinopse.append(sinopse)
    }
    
    public func setList(list: Details) {
        self.list.append(list)
    }
}
