//
//  MainUserView.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 13/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class MainUserView: UIViewController {

//    l
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.titleLabel!.text = "Login"
        let customFont = UIFont(name: Theme.current.fontNormal, size: 21)
        button.titleLabel?.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: customFont!)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitle("Ver productos", for: .normal)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(Theme.current.textColor, for: .normal)
        button.backgroundColor = Theme.current.buttonBackGround
        button.addTarget(self, action: #selector(toProducts), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadFunctions()
    }
    
    func setupLoadFunctions(){
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = Theme.current.backGround
        self.title = "Home"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = Theme.current.navBarColor
        self.navigationController?.navigationBar.barTintColor = Theme.current.navBarColor
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = Theme.current.tint
        
    }
    func setupNavBar(){
        
        view.addSubview(submitButton)
        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func toProducts(){
        let productListCVView = ProductListCVView()
        productListCVView.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(productListCVView, animated: true)
    }
    
}
