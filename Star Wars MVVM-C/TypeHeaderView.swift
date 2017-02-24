//
//  TypeHeaderView.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 22/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import UIKit
import SwifterSwift

class TypeHeaderView: UICollectionReusableView {
    
    var viewModel: TypeHeaderViewViewModel?
    var delegate: TypeHeaderViewViewModelDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let maxCellWidth: CGFloat = 51.5
    let insets: CGFloat = 8
    var total: CGFloat {
        return CGFloat(viewModel?.types.count ?? 0)
    }
    var numberOfSpacings: CGFloat {
        return total - 1
    }
    var maxWidthAvailable: CGFloat {
        return width - (insets * 2) // Max width available to use
    }
    var minimumWidthForMaxCellWidth: CGFloat {
        return maxCellWidth * 6
    }
    var interItemSpacing: CGFloat {
        if maxWidthAvailable > minimumWidthForMaxCellWidth {
            return (maxWidthAvailable - minimumWidthForMaxCellWidth) / numberOfSpacings
        }
        return 8
    }
    var totalInterItemSpacing: CGFloat {
        return numberOfSpacings * interItemSpacing // Total item spacing between cells
    }
    var cellHeight: CGFloat {
        return height - (insets * 2) - 4
    }
    var cellSize: CGSize {
        // Screen is smaller than it needs so it will shrink its width
        if maxWidthAvailable < minimumWidthForMaxCellWidth {
            return CGSize(width: (maxWidthAvailable - totalInterItemSpacing) / total, height: cellHeight)
        }
        // Screen is bigger or just as much as it needs
        return CGSize(width: maxCellWidth, height: cellHeight)
    }
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionHeadersPinToVisibleBounds = true
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.isScrollEnabled = false
        cv.bounces = false
        cv.contentInset = UIEdgeInsets(top: 8, left: self.insets, bottom: 8, right: self.insets)
        cv.register(TypeCell.self, forCellWithReuseIdentifier: TypeCell.reuseId)
        return cv
    }()
}

extension TypeHeaderView: CodeBased {
    func setupViews() {
        backgroundColor = .white
        
        addSubview(collectionView)
        collectionView.fillToSuperview()
    }
}

extension TypeHeaderView: TypeHeaderViewViewModelTransitionDelegate {
    func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension TypeHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.types.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeCell.reuseId, for: indexPath) as? TypeCell,
            let currentType = viewModel?.types[indexPath.item]
        else {
            return UICollectionViewCell()
        }
        cell.title = currentType.type.rawValue
        cell.image = currentType.image
        return cell
    }
}

extension TypeHeaderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let currentType = viewModel?.types.item(at: indexPath.row) {
            if viewModel?.selectedType == currentType.type {
                delegate?.scrollToTop()
            } else {
                // API call
                delegate?.onTypeSelected(selectedType: currentType.type)
            }
            viewModel?.selectedType = currentType.type
        }
    }
}

extension TypeHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        print(interItemSpacing)
        return interItemSpacing
    }
}
















