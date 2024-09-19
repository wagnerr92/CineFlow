//
//  ProfileViewController.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 16/09/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perfil"
        addConfigTableView()
    }
}


extension ProfileViewController {
    private func addConfigTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseId)
        tableView.isScrollEnabled = false
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseId, for: indexPath) as? MenuTableViewCell
        
        if let cell = cell  {
            cell.accessoryType = .disclosureIndicator
            cell.setupCell(menu: viewModel.menu[indexPath.row])
        }
        return cell ?? MenuTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MenuTableViewCell {
            cell.selectionStyle = .none
        }
        
        switch indexPath.row {
        case 0:
            let controller = UIStoryboard(name: "PersonDataStoryboard", bundle: nil).instantiateViewController(withIdentifier: String(describing: PersonalDataViewController.self)) as? PersonalDataViewController
            navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
        case 1:
            print("dddd")
        case 2:
            showSimpleAlert(title: "Atenção",
                            message: "Deseja sair da conta?",
                            customTitle: "Sim",
                            customHandler: {_ in
                self.navigationController?.pushViewController(LoginViewController(), animated: true)
            }, cancelTitle: "Não")
        default:
            break
        }
    }
}
