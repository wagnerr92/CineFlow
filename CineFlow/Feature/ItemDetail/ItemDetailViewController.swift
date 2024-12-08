//
//  ItemDetailViewController.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 23/10/24.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    private var mainView: ItemDetailView = .init()
    private var viewModel: ItemDetailViewModel = ItemDetailViewModel()
    private var sinopse: String?
    private var detailItem: Details
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    init(sinopse: String, detailItem: Details) {
        self.sinopse = sinopse
        self.detailItem = detailItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemDetailViewController {
    private func configuration() {
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
    }
}

extension ItemDetailViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3 + viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ContentHeaderCell.reuseId, for: indexPath) as? ContentHeaderCell
            viewModel.setList(list: Details(image: "https://image.tmdb.org/t/p/w500\(String(describing: detailItem.image))",
                                            contentTitle: detailItem.contentTitle,
                                            time: detailItem.time,
                                            yearOfRelease: detailItem.yearOfRelease,
                                            formatImage: detailItem.formatImage,
                                            movieRatings: detailItem.movieRatings,
                                            pointsMovie: detailItem.pointsMovie))
            cell?.setupCell(details: viewModel.getList(indexPath: indexPath))
            cell?.delegate = self
           cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
            
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.reuseId, for: indexPath) as? DescriptionCell
            viewModel.setSinopse(sinopse: MovieDescription(descripton: "\(self.sinopse ?? "")"))

            cell?.setupCell(data: viewModel.getSinopse(indexPath: indexPath))
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
            
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieImagesCell.reuseId, for: indexPath) as? MovieImagesCell
            cell?.setupCell(data: viewModel.getListPhotos(indexPath: indexPath))
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
            
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: ActorsCell.reuseId, for: indexPath) as? ActorsCell
            cell?.setupCell(data: viewModel.getDetailsActors(indexPath: indexPath))
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 400
        }else if indexPath.row == 1{
            return 150
        } else if indexPath.row == 2 {
            return 250
        }else if indexPath.row == 3 {
            return 250
        }else {
            return UITableView.automaticDimension
        }
    }
}

extension ItemDetailViewController: ContentHeaderCellProtocol {
    func didtappedReturnButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func didtappedAddButton() {
        showAlert(title: "Adicionar", message: "Você deseja adicionar este item a sua lista?") { confirmed in
            if confirmed {
                self.navigation()
            }
        }
    }
    func showAlert(title: String, message: String,completion: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            completion(true)
                                  }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { _ in
            completion(false)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func navigation(){
        let addVC = UIStoryboard(name: "AddListStoryboard", bundle: nil).instantiateViewController(withIdentifier: "AddListViewController") as? AddListViewController
        navigationController?.pushViewController(addVC ?? UIViewController(), animated: true)
    }
}
