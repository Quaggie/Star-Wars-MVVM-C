//
//  ViewController.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import UIKit
import SwifterSwift

class StarWarsViewController: UIViewController {
    
    var starWarsViewModel: StarWarsViewModel?
    var typeHeaderViewViewModel: TypeHeaderViewViewModel?
    var typeHeaderViewViewModelTransitionDelegate: TypeHeaderViewViewModelTransitionDelegate?
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionHeadersPinToVisibleBounds = true
        flowLayout.minimumLineSpacing = 16
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .clear
        cv.bounces = true
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        cv.register(FilmCell.self, forCellWithReuseIdentifier: FilmCell.reuseId)
        cv.register(PersonCell.self, forCellWithReuseIdentifier: PersonCell.reuseId)
        cv.register(TypeHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: TypeHeaderView.reuseId)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    convenience init (starWarsViewModel: StarWarsViewModel?, typeHeaderViewViewModel: TypeHeaderViewViewModel?) {
        self.init()
        self.starWarsViewModel = starWarsViewModel
        self.starWarsViewModel?.delegate = self
        self.typeHeaderViewViewModel = typeHeaderViewViewModel
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
        typeHeaderViewViewModelTransitionDelegate?.willTransition(to: newCollection, with: coordinator)
    }
}

// MARK: CodeBased
extension StarWarsViewController: CodeBased {
    func setupViews() {
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.3)
        
        view.addSubview(collectionView)
        collectionView.fillToSuperview()
    }
}

extension StarWarsViewController: StarWarsViewModelDelegate {
    func loadedData(data: Any?, finished: Bool) {
        collectionView.reloadData()
    }
    
    func loadedNextPage(data: Any?, finished: Bool) {
        // TODO
    }
    
    func onTypeSelected(selectedType: StarWarsType) {
        // Clear cells
        // Start searching
        // if typeOnCell == selectedType -> ScrollToTop
    }
}

// MARK: TypeHeaderViewViewModelDelegate
extension StarWarsViewController: TypeHeaderViewViewModelDelegate {
    
}

// MARK: UICollectionViewDataSource
extension StarWarsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let data = starWarsViewModel?.data as? StarWarsObject<Person> {
            return data.results?.count ?? 0
        }
        if let data = starWarsViewModel?.data as? StarWarsObject<Film> {
            return data.results?.count ?? 0
        }
        if let data = starWarsViewModel?.data as? StarWarsObject<Starship> {
            return data.results?.count ?? 0
        }
        if let data = starWarsViewModel?.data as? StarWarsObject<Vehicle> {
            return data.results?.count ?? 0
        }
        if let data = starWarsViewModel?.data as? StarWarsObject<Specie> {
            return data.results?.count ?? 0
        }
        if let data = starWarsViewModel?.data as? StarWarsObject<Planet> {
            return data.results?.count ?? 0
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let starWarsObject = starWarsViewModel?.data as? StarWarsObject<Person> {
            let person = starWarsObject.results?.item(at: indexPath.item)
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCell.reuseId, for: indexPath) as? PersonCell {
                cell.person = person
                return cell
            }
            
        }
        if let starWarsObject = starWarsViewModel?.data as? StarWarsObject<Film> {
            let film = starWarsObject.results?.item(at: indexPath.item)
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.reuseId, for: indexPath) as? FilmCell {
                cell.film = film
                return cell
            }
        }
        if let _ = starWarsViewModel?.data as? StarWarsObject<Starship> {
            
        }
        if let _ = starWarsViewModel?.data as? StarWarsObject<Vehicle> {
            
        }
        if let _ = starWarsViewModel?.data as? StarWarsObject<Specie> {
            
        }
        if let _ = starWarsViewModel?.data as? StarWarsObject<Planet> {
            
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: TypeHeaderView.reuseId, for: indexPath) as? TypeHeaderView {
                // Adding the scroll delegate to the header
                typeHeaderViewViewModelTransitionDelegate = headerView
                headerView.viewModel = typeHeaderViewViewModel
                return headerView
            }
        default: break
        }
        return UICollectionReusableView()
    }
}

// MARK: UICollectionViewDelegate
extension StarWarsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension StarWarsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.width, height: 50)
    }
}
























