//
//  categoryProductCell.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 14/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class categoryProductCell: UICollectionViewCell {
    
    let containerLabel : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let restaurantImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        iv.backgroundColor = Theme.current.viewColor
        iv.layer.shadowColor = UIColor.black.cgColor
        iv.layer.shadowOpacity = 0.5
        iv.layer.shadowOffset = .zero
        iv.layer.shadowRadius = 3
        iv.layer.masksToBounds = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
//        addSubview(containerLabel)
        addSubview(restaurantImage)
        restaurantImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        restaurantImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        restaurantImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        restaurantImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
//        containerLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
//        containerLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
//        containerLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
//        containerLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    }

    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}//cell
