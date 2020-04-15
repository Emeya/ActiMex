//
//  ProductItemCell.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 14/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class ProductItemCell: UICollectionViewCell {
    
    let mainContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    let buttonView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.navBarColor
        view.layer.cornerRadius = 5
        view.image = UIImage(named: "shoppingCartAdd")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = Theme.current.tint
        //        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
        return view
    }()
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.viewColor
        view.layer.cornerRadius = 5
//        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.7
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = false
        
        return view
    }()
    
    let productNameLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Productos"
        lb.textColor = Theme.current.textColor
        let customFont = UIFont(name: Theme.current.fontBold, size: 34)
        lb.font = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: customFont!)
        lb.adjustsFontForContentSizeCategory = true
        lb.textAlignment = .left
        lb.numberOfLines = 1
        return lb
    }()
    
    let productSmolDescLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Smol"
        lb.textColor = Theme.current.textColor
        let customFont = UIFont(name: Theme.current.fontBold, size: 15)
        lb.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont!)
        lb.adjustsFontForContentSizeCategory = true
        lb.textAlignment = .left
        lb.numberOfLines = 2
        return lb
    }()
    
    let productImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "ActiMexLogo")
        return iv
    }()
    
    let productPriceLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "$628"
        lb.textColor = Theme.current.textColor
        let customFont = UIFont(name: Theme.current.fontBold, size: 28)
        lb.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: customFont!)
        lb.adjustsFontForContentSizeCategory = true
        lb.textAlignment = .left
        lb.numberOfLines = 1
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews(){
        
        addSubview(mainContainerView)
        mainContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        mainContainerView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: mainContainerView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: mainContainerView.bottomAnchor, constant: -25).isActive = true
        
        containerView.addSubview(productImage)
        productImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        productImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        productImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        productImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        productImage.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
//        productImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        
        containerView.addSubview(productNameLabel)
        productNameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10).isActive = true
        productNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        productNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        containerView.addSubview(productSmolDescLabel)
        productSmolDescLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5).isActive = true
        productSmolDescLabel.leadingAnchor.constraint(equalTo: productNameLabel.leadingAnchor).isActive = true
        productSmolDescLabel.trailingAnchor.constraint(equalTo: productNameLabel.trailingAnchor).isActive = true
        
        containerView.addSubview(productPriceLabel)
        
        productPriceLabel.topAnchor.constraint(equalTo: productSmolDescLabel.bottomAnchor, constant: 5).isActive = true
        productPriceLabel.leadingAnchor.constraint(equalTo: productNameLabel.leadingAnchor).isActive = true
        productPriceLabel.trailingAnchor.constraint(equalTo: productNameLabel.trailingAnchor).isActive = true
        
        
        mainContainerView.addSubview(buttonView)
        buttonView.bottomAnchor.constraint(equalTo: mainContainerView.bottomAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}//cell
