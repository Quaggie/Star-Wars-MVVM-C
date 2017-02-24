//
//  PersonCell.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 24/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    var person: Person? {
        didSet {
            guard let person = person else {
                return
            }
            if let name = person.name {
                nameLabel.text = name
            }
            if let gender = person.gender, let height = person.height {
                genderHeightLabel.text = "\(gender.capitalized) | \(height)cm"
            }
            if let birth_year = person.birth_year {
                birthLabel.text = "Born in \(birth_year)"
            }
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.cornerRadius = 3.0
        view.addShadow()
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 20, weight: 0.4)
        label.lineBreakMode = .byTruncatingTail
        label.text = "..."
        return label
    }()
    
    let genderHeightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: 0.2)
        label.lineBreakMode = .byTruncatingTail
        label.text = "..."
        return label
    }()
    
    let birthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: 0.2)
        label.lineBreakMode = .byTruncatingTail
        label.text = "..."
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PersonCell: CodeBased {
    func setupViews() {
        backgroundColor = .clear
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        addSubview(genderHeightLabel)
        genderHeightLabel.anchor(top: nameLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        addSubview(birthLabel)
        birthLabel.anchor(top: genderHeightLabel.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 0)
    }
}







