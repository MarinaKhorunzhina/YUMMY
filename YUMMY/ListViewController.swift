//
//  ViewController.swift
//  YUMMY
//
//  Created by Marina on 13.10.22.
//


import UIKit

class ListViewController: UIViewController {
    
    let sections = Bundle.main.decode([Section].self, from: "baners.json")
    var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Baners>?

    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        setupCollectionView()
        createDataSource()
        reloadData()
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        view.addSubview(collectionView)
        
        collectionView.register(BanersCell.self, forCellWithReuseIdentifier: BanersCell.reuseId)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.reuseId)
        
    }
    
    // MARK: - Manage the data in UICV
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Baners>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
            switch self.sections[indexPath.section].type {
            case "baners":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BanersCell.reuseId, for: indexPath) as? BanersCell
                cell?.configure(with: chat)
                return cell
            case "category":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as? CategoryCell
                cell?.configure(with: chat)
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.reuseId, for: indexPath) as? ListCell
                cell?.configure(with: chat)
                return cell
            }
        })
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Baners>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource?.apply(snapshot)
    }
    
    // MARK: - Setup Layout
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.sections[sectionIndex]
            
            switch section.type {
            case "baners":
                return self.createBaners()
            case "category":
                return self.createCategory()
            
            default:
                return self.createList()
            }
        }
        
        return layout
    }
    
    private func createBaners() -> NSCollectionLayoutSection {
   
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .fractionalHeight(1))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
   
           let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(300),
                                                  heightDimension: .absolute(112))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
   
           let section = NSCollectionLayoutSection(group: group)
           section.interGroupSpacing = 20
           section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
           section.orthogonalScrollingBehavior = .continuous
   
   
           return section
       }
    
    private func createCategory() -> NSCollectionLayoutSection {
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .fractionalHeight(1))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
   
           let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88),
                                                  heightDimension: .absolute(32))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
   
           let section = NSCollectionLayoutSection(group: group)
           section.interGroupSpacing = 20
           section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
           section.orthogonalScrollingBehavior = .continuous
   
           return section
       }
    private func createList() -> NSCollectionLayoutSection {
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .fractionalHeight(1))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
   
           let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .absolute(156))
           let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
   
           let section = NSCollectionLayoutSection(group: group)
           section.interGroupSpacing = 1
           section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 0, bottom: 0, trailing: 0)
   
           return section
       }
    
    // section -> groups -> items -> size
}

// MARK: - SwiftUI
import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        
        let listVC = ListViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> ListViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController: ListProvider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
            
        }
    }
}



