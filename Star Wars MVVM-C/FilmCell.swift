//
//  FilmCell.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 24/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import UIKit
import SwifterSwift

class FilmCell: UICollectionViewCell {
    
    var film: Film? {
        didSet {
            // Change the views
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        view.layer.shouldRasterize = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilmCell: CodeBased {
    func setupViews() {
        backgroundColor = .clear
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
    }
}

