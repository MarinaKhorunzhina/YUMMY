//
//  MainTabBarController.swift
//  YUMMY
//
//  Created by Marina on 15.10.22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listViewController = ListViewController()
        let nextVC = NextVC()
        tabBar.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        let menu = UIImage(named: "Меню")!
        let contact = UIImage(named: "Контакты")!
        
        viewControllers = [generateNavigationController(rootViewController: listViewController, image: menu),generateNavigationController(rootViewController: nextVC, image: contact)]
        
    }
    
    private func generateNavigationController(rootViewController: UIViewController, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
