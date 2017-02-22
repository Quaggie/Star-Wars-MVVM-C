//
//  TypeCell.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 22/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import UIKit
import SwifterSwift

class TypeCell: UICollectionViewCell {
    
    var image: UIImage? {
        didSet {
            imageView.image = image?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    var title: String?
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .darkGray
        iv.clipsToBounds = true
        iv.borderWidth = 3
        iv.borderColor = .darkGray
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted == true ? 0.5 : 1
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        print(TypeCell.reuseId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TypeCell: CodeBased {
    func setupViews() {
        backgroundColor = .white
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: height)
        imageView.cornerRadius = height / 2
    }
}
























