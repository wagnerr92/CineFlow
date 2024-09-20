//
//  ListViewController.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 20/08/24.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let emptyTableView = EmptyTableView(titleLabel: "Atenção", messageLabel: "Nenhuma lista encontrada \npor favor crie uma lista.")
    var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLlayout()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func AddList(_ sender: UIBarButtonItem) {
        guard let controller = UIStoryboard(name: "AddListStoryboard", bundle: nil).instantiateViewController(withIdentifier: "AddListViewController") as? AddListViewController else { return }
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  Helper.shared.nameListed.count == 0 {
            self.tableView.backgroundView = self.emptyTableView
            self.tableView.isScrollEnabled = false
        } else {
            self.tableView.backgroundView = .none
        }
        return  Helper.shared.nameListed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListTableViewCell
        let image = CFImage.rightArrow
        let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!))
        accessory.image = image
        accessory.tintColor = CFColor.white
        if let cell = cell {
            cell.textLabel?.textColor = CFColor.white
            cell.textLabel?.text =  Helper.shared.nameListed[indexPath.row]
            cell.accessoryView = accessory
        }
        return cell ?? ListTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = UIStoryboard(name: "DetailListStoryboard", bundle: nil).instantiateViewController(withIdentifier: "DetailListViewController") as? DetailListViewController else { return }
        controller.listName = Helper.shared.nameListed[indexPath.row]
        controller.numberIndex = indexPath.row
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ListViewController {
    private func addLlayout() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
