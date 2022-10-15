//
//  ListCell.swift
//  YUMMY
//
//  Created by Marina on 15.10.22.
//

import UIKit

class ListCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "ListCell"
    
    
    
    var nameFood = UILabel(text: "Пеперони")
    var foodImageString = UIImageView()
    var consist = UILabel(text: "Бекон, сыр")
    var price = UILabel(text: " от 300р ")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let list: Baners = value as? Baners else { return }
        nameFood.text = list.nameFood
        foodImageString.image = UIImage(named: list.foodImageString)
        consist.text = list.consist
        price.text = list.price
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup constraints
extension ListCell {
    private func setupConstraints() {
        nameFood.translatesAutoresizingMaskIntoConstraints = false
        foodImageString.translatesAutoresizingMaskIntoConstraints = false
        consist.translatesAutoresizingMaskIntoConstraints = false
        price.translatesAutoresizingMaskIntoConstraints = false
       
        
        
        addSubview(nameFood)
        addSubview(foodImageString)
        addSubview(consist)
        addSubview(price)
        
        
        NSLayoutConstraint.activate([
            foodImageString.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            foodImageString.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            foodImageString.heightAnchor.constraint(equalToConstant: 78),
            foodImageString.widthAnchor.constraint(equalToConstant: 78)
        ])
        
    }
}
