//
//  CategoryCell.swift
//  YUMMY
//
//  Created by Marina on 14.10.22.
//

import UIKit

class CategoryCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "CategoryCell"
    
    
    let nameCategory = UILabel(text: "Category")
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        setupConstraints()
        
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
       
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
        nameCategory.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        nameCategory.layer.borderColor =  #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
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
