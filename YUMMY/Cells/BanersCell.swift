//
//  BanersCell.swift
//  YUMMY
//
//  Created by Marina on 13.10.22.
//

import UIKit

class BanersCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "BanersCell"
    
    
    let imageStringURL = UIImageView()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let baners: Baners = value as? Baners else { return }
        imageStringURL.image = UIImage(named: baners.imageStringURL)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup constraints
extension BanersCell {
    private func setupConstraints() {
        imageStringURL.translatesAutoresizingMaskIntoConstraints = false
        
       
        
        imageStringURL.backgroundColor = .orange
        
        
        addSubview(imageStringURL)
      
        
        
        NSLayoutConstraint.activate([
            imageStringURL.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageStringURL.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageStringURL.heightAnchor.constraint(equalToConstant: 112),
            imageStringURL.widthAnchor.constraint(equalToConstant: 300)
        ])
        
    }
}

//// MARK: - SwiftUI
//import SwiftUI
//
//struct BanersCellProvider: PreviewProvider {
//    static var previews: some View {
//        ContainerView().edgesIgnoringSafeArea(.all)
//    }
//    
//    struct ContainerView: UIViewControllerRepresentable {
//        
//        let tabBarVC = BanersCell()
//        
//        func makeUIViewController(context: UIViewControllerRepresentableContext<BanersCellProvider.ContainerView>) -> BanersCell {
//            return tabBarVC
//        }
//        
//        func updateUIViewController(_ uiViewController: ListVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<BanersCellProvider.ContainerView>) {
//            
//        }
//    }
//}
//
