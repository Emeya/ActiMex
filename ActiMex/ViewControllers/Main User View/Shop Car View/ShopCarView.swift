//
//  ShopCarView.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 14/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class ShopCarView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLoadFunctions()
    }
    
    func setupLoadFunctions(){
        setupNavBar()
    }
    
    func setupNavBar(){
        self.view.backgroundColor = Theme.current.backGround
        self.title = "Carrito"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = Theme.current.navBarColor
        self.navigationController?.navigationBar.barTintColor = Theme.current.navBarColor
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = Theme.current.tint
    }
}
