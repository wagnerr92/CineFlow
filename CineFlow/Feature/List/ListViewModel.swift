//
//  ListViewModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 20/08/24.
//

import UIKit
protocol ListViewModelDelegate: AnyObject {
    func didSuccess()
}

class ListViewModel {

    weak var delegate: ListViewModelDelegate?
    
    func saveList(nameList: String) {
        Helper.shared.nameListed.append(nameList)
        self.delegate?.didSuccess()
    }
}
