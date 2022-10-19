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
        backgroundColor = .white
        setupConstraints()
        
        self.layer.cornerRadius = 20
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
        nameFood.font = UIFont.boldSystemFont(ofSize: 17)
        consist.numberOfLines = 6
        consist.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        price.layer.borderWidth = 1
        price.layer.borderColor =  #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        price.textAlignment = NSTextAlignment.center
        price.layer.cornerRadius = 6
        price.textColor =  #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        
//        label.textColor = UIColor.blue
//        label.font = UIFont.boldSystemFont(ofSize: 15)
//        label.textAlignment = NSTextAlignment.left
//        label.layer.borderColor = UIColor.black.cgColor
//        label.layer.borderWidth = 1
        
        addSubview(nameFood)
        addSubview(foodImageString)
        addSubview(consist)
        addSubview(price)
        
        
        NSLayoutConstraint.activate([
          
            foodImageString.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            foodImageString.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            foodImageString.heightAnchor.constraint(equalToConstant: 132),
            foodImageString.widthAnchor.constraint(equalToConstant: 132)
        ])
        
        NSLayoutConstraint.activate([
            nameFood.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameFood.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            nameFood.leadingAnchor.constraint(equalTo: foodImageString.trailingAnchor, constant: 32),
         //   nameFood.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameFood.heightAnchor.constraint(equalToConstant: 29),
            nameFood.widthAnchor.constraint(equalToConstant: 136)
        ])
        
        NSLayoutConstraint.activate([
            consist.topAnchor.constraint(equalTo: nameFood.bottomAnchor, constant: 8),
            consist.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            consist.leadingAnchor.constraint(equalTo: foodImageString.trailingAnchor, constant: 32),
         //   nameFood.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            consist.heightAnchor.constraint(equalToConstant: 64),
            consist.widthAnchor.constraint(equalToConstant: 171)
        ])
        
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: consist.bottomAnchor, constant: 8),
            price.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
          //  consist.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         //   nameFood.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            price.heightAnchor.constraint(equalToConstant: 32),
            price.widthAnchor.constraint(equalToConstant: 87)
        ])
    }
}
