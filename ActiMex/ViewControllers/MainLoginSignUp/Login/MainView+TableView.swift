//
//  MainView+TableView.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 13/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import Foundation
import UIKit

fileprivate let loginHeader = "loginHeader"
fileprivate let loginCell = "loginCell"
extension MainViewController{
    
    func setupTableView(){
        //view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Theme.current.backGround
        tableView.tableHeaderView?.backgroundColor = .clear
//        tableView.style = .grouped
        //tableView.isUserInteractionEnabled = false
        //        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        //        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: loginCell)
        tableView.register(LoginHeader.self, forHeaderFooterViewReuseIdentifier: loginHeader)
//        tableView.tableHeaderView = LoginHeader
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: loginCell, for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.addSubview(loginImputsContainer)
        
        loginImputsContainer.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        loginImputsContainer.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        loginImputsContainer.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        loginImputsContainer.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
        //missing bottom
        
        loginImputsContainer.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: loginImputsContainer.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: loginImputsContainer.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: loginImputsContainer.trailingAnchor, constant: -10).isActive = true
        
        loginImputsContainer.addSubview(subtitleLabel)
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        loginImputsContainer.addSubview(loginFieldsContainer)
        loginFieldsContainer.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 5).isActive = true
        loginFieldsContainer.leadingAnchor.constraint(equalTo: loginImputsContainer.leadingAnchor).isActive = true
        loginFieldsContainer.trailingAnchor.constraint(equalTo: loginImputsContainer.trailingAnchor).isActive = true
//        loginFieldsContainer.bottomAnchor.constraint(equalTo: loginImputsContainer.bottomAnchor).isActive = true
//        loginFieldsContainer
        
        
        loginFieldsContainer.addSubview(userNameTF)
        userNameTF.topAnchor.constraint(equalTo: loginFieldsContainer.topAnchor, constant: 10).isActive = true
        userNameTF.leadingAnchor.constraint(equalTo: loginFieldsContainer.leadingAnchor, constant: 10).isActive = true
        userNameTF.trailingAnchor.constraint(equalTo: loginFieldsContainer.trailingAnchor, constant: -10).isActive = true
        userNameTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginFieldsContainer.addSubview(passwordTF)
        passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 10).isActive = true
        passwordTF.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        passwordTF.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginFieldsContainer.addSubview(submitButton)
        submitButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginFieldsContainer.addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: loginFieldsContainer.leadingAnchor, constant: 10).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: loginFieldsContainer.trailingAnchor, constant: -10).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: loginImputsContainer.bottomAnchor, constant: -5).isActive = true
//        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginFieldsContainer.bottomAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 0).isActive = true
        
        return cell
    }
    
    @objc func toMainUserView(){
        submitButton.touchAnimation(s: submitButton) {
//            let signUpView = SignUprViewController()
//            signUpView.modalPresentationStyle = .formSheet
//            signUpView.modalTransitionStyle = .coverVertical
//            self.present(signUpView, animated: true)
            
            let mainTabBar = MainTabBarView()
            //let userView = UserViewController()
            mainTabBar.modalPresentationStyle = .fullScreen
            mainTabBar.modalTransitionStyle = .coverVertical
            mainTabBar.selectedViewController = mainTabBar.viewControllers![0]
            self.present(mainTabBar, animated: true)
            
        }
    }
    
    @objc func toSignUpView(){
        signUpButton.touchAnimation(s: signUpButton) {        
            let signUpView = SignUprViewController()
            signUpView.modalPresentationStyle = .formSheet
            signUpView.modalTransitionStyle = .coverVertical
            self.present(signUpView, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: loginHeader) as! LoginHeader
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.height / 3
    }
    
    
    
    
    
    
}
