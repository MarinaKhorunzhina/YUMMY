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
        backgroundColor = .yellow
        setupConstraints()
        
        self.layer.cornerRadius = 4
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
        
        addSubview(nameCategory)
      
        
        
        NSLayoutConstraint.activate([
            nameCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameCategory.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCategory.heightAnchor.constraint(equalToConstant: 78),
            nameCategory.widthAnchor.constraint(equalToConstant: 78)
        ])
        
    }
}
    extension UILabel {
        
        convenience init(text: String) {
            self.init()
            
            self.text = text
            
        }
        
    }
