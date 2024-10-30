//
//  ItemDetailView.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 23/10/24.
//

import UIKit


final class ItemDetailView: UIView {
    var tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemDetailView {
    
private func addtableView() {
    addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
        
    tableView.register(ContentHeaderCell.nib(), forCellReuseIdentifier: ContentHeaderCell.reuseId)
    tableView.backgroundColor = .black
    tableView.register(DescriptionCell.nib(), forCellReuseIdentifier: DescriptionCell.reuseId)
    tableView.register(ActorsCell.nib(), forCellReuseIdentifier: ActorsCell.reuseId)
    tableView.register(MovieImagesCell.nib(), forCellReuseIdentifier: MovieImagesCell.reuseId)
    tableView.showsVerticalScrollIndicator = false
    
    NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ItemDetailView {
    private func addLayout() {
        addtableView()
    }
}
