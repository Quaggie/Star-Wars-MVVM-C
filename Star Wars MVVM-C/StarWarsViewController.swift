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
    
    var starWarsViewModel: StarWarsViewModel? {
        didSet {
            starWarsViewModel?.delegate = self
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionHeadersPinToVisibleBounds = true
        flowLayout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .clear
        cv.bounces = true
        cv.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        cv.register(cellWithClass: UICollectionViewCell.self)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    convenience init (starWarsViewModel: StarWarsViewModel?) {
        self.init()
        self.starWarsViewModel = starWarsViewModel
    }
}

// MARK: CodeBased
extension StarWarsViewController: CodeBased {
    func setupViews() {
        view.backgroundColor = .white
        
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
        if let _ = starWarsViewModel?.data as? StarWarsObject<Person> {
            
        }
        if let _ = starWarsViewModel?.data as? StarWarsObject<Film> {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "alou", for: indexPath)
            cell.backgroundColor = .black
            return cell
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
        return CGSize(width: view.frame.size.width, height: 100)
    }
}
























