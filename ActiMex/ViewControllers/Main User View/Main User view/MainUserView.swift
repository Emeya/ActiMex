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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadFunctions()
    }
    
    func setupLoadFunctions(){
        setupNavBar()
    }
    
    func setupNavBar(){
        self.view.backgroundColor = Theme.current.backGround
        self.title = "Home"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = Theme.current.navBarColor
        self.navigationController?.navigationBar.barTintColor = Theme.current.navBarColor
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = Theme.current.tint
    }
    
}
