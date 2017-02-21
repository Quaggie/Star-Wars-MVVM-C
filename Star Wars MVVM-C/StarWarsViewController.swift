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
    
    var isSearching = false
    var selectedType: StarWarsType = .person
    
    var starWarsViewModel: StarWarsViewModel?
    
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
    func loadedData() {
        collectionView.reloadData()
    }
}

// MARK: UICollectionViewDataSource
extension StarWarsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
























