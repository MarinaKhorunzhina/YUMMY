//
//  ViewController.swift
//  YUMMY
//
//  Created by Marina on 13.10.22.
//

import UIKit

class ListViewController: UIViewController {
    
    let baners = Bundle.main.decode([Baners].self, from: "baners.json")
    let category = Bundle.main.decode([Category].self, from: "category.json")
    let list = Bundle.main.decode([List].self, from: "list.json")
    
    enum Section: Int, CaseIterable {
        case  baners, category, list
        func description() -> String {
            switch self {
            
            case .baners:
                return "baners"
            case .category:
                return "category"
            case .list:
                return "list"
            }
    }
}
    var dataSource: UICollectionViewDiffableDataSource<Section, Baners>?
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData()
    }
    
//    private func setupSearchBar() {
//        navigationController?.navigationBar.barTintColor = .gray
//        navigationController?.navigationBar.shadowImage = UIImage()
//        let searchController = UISearchController(searchResultsController: nil)
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = false
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.delegate = self
//    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .gray
        view.addSubview(collectionView)
        
      
        
        collectionView.register(BanersCell.self, forCellWithReuseIdentifier: BanersCell.reuseId)
       
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Baners>()
        
        snapshot.appendSections([.baners, .category, .list])
        
        snapshot.appendItems(baners, toSection: .baners)
      //  snapshot.appendItems(activeChats, toSection: .activeChats)

        dataSource?.apply(snapshot, animatingDifferences: true)
    }


// MARK: - Data Source
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Baners>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .baners:
                return self.configure(cellType: BanersCell.self, with: chat, for: indexPath)
        
            case .category:
               // return self.configure(cellType: WaitingChatCell.self, with: chat, for: indexPath)
                print ("category")
            case .list:
                print ("list")
            }
            return nil
     })
    
    }
}

// MARK: - Setup layout
extension ListViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (senctionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let section = Section(rawValue: senctionIndex) else {
                fatalError("Unknown section kind")
            }
        
            switch section {
            case .baners:
                return self.createBaners()
                
            case .category:
                print ("list")
               // return self.createWaitingChats()
            case .list:
               print ("list")
            }
        return nil
        }
    
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createBaners() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88),
                                               heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        
        
        return section
    }
    
    private func createActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        
        
        return section
    }
  
}
// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
extension ListViewController {
    
    private func configure<T: SelfConfiguringCell>(cellType: T.Type, with value: Baners, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(with: value)
        return cell
    }
}

import SwiftUI

struct ListVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = ListViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListVCProvider.ContainerView>) -> ListViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: ListVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListVCProvider.ContainerView>) {
            
        }
    }
}

