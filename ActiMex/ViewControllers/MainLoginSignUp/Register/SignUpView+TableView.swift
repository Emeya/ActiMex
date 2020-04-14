//
//  SignUpView+TableView.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 13/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import Foundation
import UIKit

fileprivate let loginHeader = "loginHeader"
fileprivate let signUpCell = "signUpCell"
extension SignUprViewController{
    
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: signUpCell)
//        tableView.register(LoginHeader.self, forHeaderFooterViewReuseIdentifier: loginHeader)
//        tableView.tableHeaderView = LoginHeader
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: signUpCell, for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.addSubview(loginImputsContainer)
        
        loginImputsContainer.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        loginImputsContainer.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        loginImputsContainer.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        loginImputsContainer.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
        //missing bottom
        
        loginImputsContainer.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: loginImputsContainer.topAnchor, constant: 70).isActive = true
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
        
        loginFieldsContainer.addSubview(apellidoTF)
        apellidoTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 10).isActive = true
        apellidoTF.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        apellidoTF.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        apellidoTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginFieldsContainer.addSubview(mailTF)
        mailTF.topAnchor.constraint(equalTo: apellidoTF.bottomAnchor, constant: 10).isActive = true
        mailTF.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        mailTF.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        mailTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginFieldsContainer.addSubview(password)
        password.topAnchor.constraint(equalTo: mailTF.bottomAnchor, constant: 10).isActive = true
        password.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        password.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        loginFieldsContainer.addSubview(submitButton)
        submitButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let gapView = UIView()
        
        loginFieldsContainer.addSubview(gapView)
        gapView.translatesAutoresizingMaskIntoConstraints = false
        gapView.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 0).isActive = true
        gapView.centerXAnchor.constraint(equalTo: submitButton.centerXAnchor).isActive = true
        gapView.bottomAnchor.constraint(equalTo: loginImputsContainer.bottomAnchor, constant: -10).isActive = true
        
        loginFieldsContainer.bottomAnchor.constraint(equalTo: gapView.bottomAnchor, constant: 0).isActive = true
        
        return cell
    }
    
    @objc func testingButtons(){
        submitButton.touchAnimation(s: submitButton) {
            print("Testing")
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
    
    
    
}
