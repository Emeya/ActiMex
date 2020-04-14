//
//  SignUprViewController.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 13/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class SignUprViewController: UITableViewController {

    let loginImputsContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let titleLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = Theme.current.titleTextColor
        let customFont = UIFont(name: Theme.current.fontBold, size: 28)
        lb.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: customFont!)
        lb.adjustsFontForContentSizeCategory = true
        lb.textAlignment = .left
        lb.numberOfLines = 1
        lb.text = "Registro"
        return lb
    }()
    
    let subtitleLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = Theme.current.bodyTextColor
        let customFont = UIFont(name: Theme.current.fontNormal, size: 20)
        lb.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: customFont!)
        lb.adjustsFontForContentSizeCategory = true
        lb.textAlignment = .left
        lb.numberOfLines = 0
        lb.text = "Ingresa tu informacion en todos los campos"
        return lb
    }()
    
    var placeHolderAttributes = [String: AnyObject]()
    let userNameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        let customFont = UIFont(name: Theme.current.fontNormal, size: 20)
        tf.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customFont!)
        //        tf.font = UIFont.preferredFont(forTextStyle: .title3)
        tf.adjustsFontForContentSizeCategory = true
        
        tf.attributedPlaceholder = NSAttributedString(string: " Nombres", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.bodyTextColor.withAlphaComponent(0.5)])
        //        tf.text = "Asasasdasd"
        tf.textColor = Theme.current.bodyTextColor
        tf.tintColor = Theme.current.tint
        tf.textAlignment = .left
        tf.keyboardAppearance = .dark
        tf.keyboardType = .default
        tf.backgroundColor = Theme.current.backGround
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.layer.borderColor = Theme.current.viewColor.cgColor
        tf.layer.borderWidth = 2
        
        return tf
    }()
    
    let apellidoTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        let customFont = UIFont(name: Theme.current.fontNormal, size: 20)
        tf.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customFont!)
        //        tf.font = UIFont.preferredFont(forTextStyle: .title3)
        tf.adjustsFontForContentSizeCategory = true
        tf.attributedPlaceholder = NSAttributedString(string: " Apellidos", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.bodyTextColor.withAlphaComponent(0.5)])
        //        tf.placeholder = "contraseña"
        tf.textColor = Theme.current.bodyTextColor
        tf.tintColor = Theme.current.tint
        tf.textAlignment = .left
        tf.keyboardAppearance = .dark
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.backgroundColor = Theme.current.backGround
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.layer.borderColor = Theme.current.viewColor.cgColor
        tf.layer.borderWidth = 2
        return tf
    }()
    
    let mailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        let customFont = UIFont(name: Theme.current.fontNormal, size: 20)
        tf.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customFont!)
        //        tf.font = UIFont.preferredFont(forTextStyle: .title3)
        tf.adjustsFontForContentSizeCategory = true
        tf.attributedPlaceholder = NSAttributedString(string: " Correo", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.bodyTextColor.withAlphaComponent(0.5)])
        //        tf.placeholder = "contraseña"
        tf.textColor = Theme.current.bodyTextColor
        tf.tintColor = Theme.current.tint
        tf.textAlignment = .left
        tf.keyboardAppearance = .dark
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.backgroundColor = Theme.current.backGround
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.layer.borderColor = Theme.current.viewColor.cgColor
        tf.layer.borderWidth = 2
        return tf
    }()
    let password: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        let customFont = UIFont(name: Theme.current.fontNormal, size: 20)
        tf.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customFont!)
        //        tf.font = UIFont.preferredFont(forTextStyle: .title3)
        tf.adjustsFontForContentSizeCategory = true
        tf.attributedPlaceholder = NSAttributedString(string: " Contraseña", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.bodyTextColor.withAlphaComponent(0.5)])
        //        tf.placeholder = "contraseña"
        tf.textColor = Theme.current.bodyTextColor
        tf.tintColor = Theme.current.tint
        tf.textAlignment = .left
        tf.keyboardAppearance = .dark
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.backgroundColor = Theme.current.backGround
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.layer.borderColor = Theme.current.viewColor.cgColor
        tf.layer.borderWidth = 2
        return tf
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.titleLabel!.text = "Login"
        let customFont = UIFont(name: Theme.current.fontBold, size: 21)
        button.titleLabel?.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: customFont!)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(Theme.current.tint, for: .normal)
        button.backgroundColor = Theme.current.navBarColor
        button.addTarget(self, action: #selector(testingButtons), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.titleLabel!.text = "Login"
        let customFont = UIFont(name: Theme.current.fontBold, size: 21)
        button.titleLabel?.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: customFont!)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitle("Nuevo? Crea una cuenta!", for: .normal)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(Theme.current.tint, for: .normal)
        button.backgroundColor = Theme.current.buttonBackGround
        button.addTarget(self, action: #selector(testingButtons), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let loginFieldsContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadFunctions()
    }
    
    func setupLoadFunctions(){
        //        view.backgroundColor = Theme.current.backGround
        
        //        view.
        //        setupSignUpButton()
        //        setuploginImputsContainer()
        setupTableView()
    }
    
    
}
