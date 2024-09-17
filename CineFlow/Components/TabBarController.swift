//
//  TabBarController.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 16/09/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTabBar()
        tabBarlayout()
    }
}

extension TabBarController {
    private func addTabBar() {
        let homeViewController: UINavigationController = {
            let controller = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController
            let navigation = UINavigationController(rootViewController: controller ?? UIViewController())
            navigation.tabBarItem = UITabBarItem(title: "Home", image: CFImage.tabBarIconHouse, tag: 0)

            return navigation
        }()
        
        let listViewController: UINavigationController = {
            let controller = UIStoryboard(name: "ListStoryboard", bundle: nil).instantiateViewController(withIdentifier: String(describing: ListViewController.self)) as? ListViewController
            let navigation = UINavigationController(rootViewController: controller ?? UIViewController())
            navigation.tabBarItem = UITabBarItem(title: "Lista", image: CFImage.tabBarIconBook, tag: 1)
            return navigation
        }()
        
        let personViewController: UINavigationController = {
            let controller = UIStoryboard(name: "PersonStoryboard", bundle: nil).instantiateViewController(withIdentifier: String(describing: PersonViewController.self)) as? PersonViewController
            let navigation = UINavigationController(rootViewController: controller ?? UIViewController())
            navigation.tabBarItem = UITabBarItem(title: "Perfil", image: CFImage.tabBarIconPerson, tag: 2)
            
            return navigation
        }()
        viewControllers = [homeViewController, listViewController, personViewController]
    }
    
    private func tabBarlayout() {
        tabBar.backgroundColor = CFColor.tabBarBackground
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .systemGray
    }
}
