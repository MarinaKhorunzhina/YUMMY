//
//  NavigationController.swift
//  YUMMY
//
//  Created by Marina on 19.10.22.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    override func viewDidAppear(_ animated: Bool) {
            //1
            let navigationBar = self.navigationController?.navigationBar
            
            //2
        navigationBar?.barStyle = UIBarStyle.black
            
            //3
            navigationBar?.tintColor = UIColor.green
            
            //4
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
            
            // 5
            let image = UIImage(named: "icon")
            imageView.image = image
            
            // 6
            navigationItem.titleView = imageView
        }
   
}
