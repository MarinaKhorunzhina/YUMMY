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
        tabBar.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)!
       
        
        viewControllers = [generateNavigationController(rootViewController: listViewController, title: "Меню", image: convImage),generateNavigationController(rootViewController: nextVC, title: "Корзина", image: convImage),generateNavigationController(rootViewController: nextVC, title: "Контакты", image: convImage)]
        
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
