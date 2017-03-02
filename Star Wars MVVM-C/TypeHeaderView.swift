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
    
    var viewModel: TypeHeaderViewViewModel? {
        didSet {
            guard let types = self.viewModel?.types else {
                return
            }
            let views = types.enumerated().map { (index, typeModel) -> UIView in
                let view = UIView()
                view.tag = index
                
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFit
                imageView.tintColor = .darkGray
                imageView.image = typeModel.image?.withRenderingMode(.alwaysTemplate)
                
                view.addSubview(imageView)
                imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: view.height)
                
                return view
            }
            stackView.removeSubviews()
            views.forEach { stackView.addArrangedSubview($0) }
        }
    }
    var delegate: TypeHeaderViewViewModelDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
                stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
}

extension TypeHeaderView: CodeBased {
    func setupViews() {
        backgroundColor = .white
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
    }
}

extension TypeHeaderView: TypeHeaderViewViewModelTransitionDelegate {
    func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        // ...
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
















