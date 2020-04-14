//
//  ThemeProtocol.swift
//  FoodxService
//
//  Created by Manuel Soberanis on 9/7/19.
//  Copyright © 2019 Manuel Soberanis. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    //var mainFont: String { get }
    var fontNormal: String { get }
    var fontItalic: String { get }
    var fontBold: String { get }
    var fontBoldItalic: String { get }
    
    
    var tint: UIColor { get }
    var navBarColor: UIColor { get }
    var backGround: UIColor { get }
    var viewColor: UIColor { get }
    var textColor: UIColor { get }
    var bodyTextColor : UIColor { get }
    var titleTextColor : UIColor { get }
    var separatorColor: UIColor { get }
    var tabBarColor: UIColor { get }
    var tinTabNav: UIColor { get }
    var buttonBackGround : UIColor { get }
    //var cellBackGroundColor: UIColor { get }
}
