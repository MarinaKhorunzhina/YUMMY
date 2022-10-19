//
//  CategoryCell.swift
//  YUMMY
//
//  Created by Marina on 14.10.22.
//

import UIKit

class CategoryCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "CategoryCell"
    
    
    let nameCategory = UILabel(text: " ")
   
    var isAlreadyVisited = false
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        
        setupConstraints()
        
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        
        self.backgroundView = {
               let view = UIView()
               view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
               return view
           }()

           self.selectedBackgroundView = {
               let view = UIView()
               view.backgroundColor = #colorLiteral(red: 0.958522141, green: 0.831869781, blue: 0.9316135049, alpha: 1)
              
               return view
               }()
    
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let category: Baners = value as? Baners else { return }
        nameCategory.text = category.nameCategory
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}

// MARK: - Setup constraints
extension CategoryCell {
    private func setupConstraints() {
        nameCategory.translatesAutoresizingMaskIntoConstraints = false
        nameCategory.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        nameCategory.layer.borderColor =  #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        nameCategory.layer.borderWidth = 1
        nameCategory.layer.cornerRadius = 16
        nameCategory.textAlignment = .center
        
        nameCategory.font = UIFont(name: nameCategory.font.fontName, size: 17)
        
        addSubview(nameCategory)
   
        
        
        NSLayoutConstraint.activate([
           // nameCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameCategory.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCategory.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameCategory.heightAnchor.constraint(equalToConstant: 32),
            nameCategory.widthAnchor.constraint(equalToConstant: 88),
           

        ])
        
    }
}
    extension UILabel {
        
        convenience init(text: String) {
            self.init()
            
            self.text = text
            
        }
        
    }
