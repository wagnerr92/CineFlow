//
//  contentDetailsVC.swift
//  CineFlow
//
//  Created by Eduardo on 15/09/24.
//

import UIKit

class ContentDetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var list: [Datails] = [Datails(image: UIImage.deadpool1, contentTitle: "DeadPool & Volverine", time: "1H 32MIN", yearOfRelease: "2023", formatImage: "4K UHD", movieRatings: "18+", pointsMovie: "3.4")]
    
    var sinopse: [MovieDescription] = [MovieDescription(descripton: "Wolverine está se recuperando quando cruza seu caminho com Deadpool. Juntos, eles formam uma equipe e enfrentam um inimigo em comum.")]
    
    var detailsActors: [Actors] = [Actors(title: "Elenco", name: ["Ryan Reynolds","Wesley Snipes ", "Morena Baccarin", "Leslie Uggams", "HughJackman", "Emma Corrin", "Dafne Keen", "Channing Tatum ", "Brianna Hildebrand"], image: ["Ryan Reynolds","Wesley Snipes ", "Morena Baccarin", "Leslie Uggams", "HughJackman", "Emma Corrin", "Dafne Keen", "Channing Tatum ", "Brianna Hildebrand"])]
    var ListPhotos: [Photos] = [Photos(title: "Fotos", image: ["deadpool", "deadpool1", "deadpool2", "deadpool3","deadpool", "deadpool1", "deadpool2", "deadpool3","deadpool", "deadpool1", "deadpool2", "deadpool3",])]
                                         
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        view.backgroundColor = .black
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    func configTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ContentHeaderCell.nib(), forCellReuseIdentifier: ContentHeaderCell.identifier)
        tableView.backgroundColor = .black
        tableView.register(DescriptionCell.nib(), forCellReuseIdentifier: DescriptionCell.identifier)
        tableView.register(ActorsCell.nib(), forCellReuseIdentifier: ActorsCell.identifier)
        tableView.register(MovieImagesCell.nib(), forCellReuseIdentifier: MovieImagesCell.identifier)
        tableView.showsVerticalScrollIndicator = false
    }
}

extension ContentDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3 + sinopse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ContentHeaderCell.identifier, for: indexPath) as? ContentHeaderCell
            cell?.setupCell(datails: list[indexPath.row])
            cell?.delegate = self
           cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
            
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath) as? DescriptionCell
            cell?.setupCell(data: sinopse[indexPath.row - 1])
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
            
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieImagesCell.identifier, for: indexPath) as? MovieImagesCell
            cell?.setupCell(data: ListPhotos[indexPath.row - 2])
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
            
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: ActorsCell.identifier, for: indexPath) as? ActorsCell
            cell?.setupCell(data: detailsActors[indexPath.row - 3])
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

extension ContentDetailsVC: ContentHeaderCellProtocol {
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
