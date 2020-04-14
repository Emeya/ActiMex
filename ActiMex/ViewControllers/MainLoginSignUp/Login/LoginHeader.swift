//
//  LoginHeader.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 13/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import Foundation
import UIKit

class LoginHeader: UITableViewHeaderFooterView {

    let containerImageView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.backGround
        return view
    }()
    
    let imageViewHeader : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "ActiMexLogo")?.withRenderingMode(.alwaysOriginal)
        iv.tintColor = Theme.current.backGround
        iv.backgroundColor = .clear
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupNotchView()
    }
    
    func setupNotchView(){
//        self.backgroundColor = Theme.current.backGround
        addSubview(containerImageView)
        contentView.backgroundColor = Theme.current.backGround
        containerImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        containerImageView.addSubview(imageViewHeader)
        imageViewHeader.centerXAnchor.constraint(equalTo: containerImageView.centerXAnchor).isActive = true
        imageViewHeader.topAnchor.constraint(equalTo: containerImageView.topAnchor).isActive = true
        imageViewHeader.bottomAnchor.constraint(equalTo: containerImageView.bottomAnchor).isActive = true
        imageViewHeader.widthAnchor.constraint(equalTo: containerImageView.heightAnchor).isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
