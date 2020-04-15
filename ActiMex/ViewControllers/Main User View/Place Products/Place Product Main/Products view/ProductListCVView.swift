//
//  ProductListCVView.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 14/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

fileprivate let productItemCellId = "ProductItemCell"
fileprivate let productCatHeader = "productCatHeader"
class ProductListCVView: UIViewController {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = true
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = Theme.current.textColor
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : Theme.current.navBarColor]
        //        self.navigationController?.navigationBar.largeTitleTextAttributes =  [.foregroundColor : Theme.current.backGround]
        
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func setupLoad(){
//     self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.tintColor = Theme.current.navBarColor
//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : Theme.current.navBarColor]
////        self.navigationController?.navigationBar.largeTitleTextAttributes =  [.foregroundColor : Theme.current.backGround]
//
//        self.navigationController?.navigationBar.backgroundColor = .clear
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        self.view.backgroundColor = Theme.current.backGround
        setupCollectionView()
    }
    
    func setupCollectionView(){
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collectionView.register(ProductItemCell.self, forCellWithReuseIdentifier: productItemCellId)
        
        collectionView.register(ProductsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: productCatHeader)
    }

}

extension ProductListCVView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productItemCellId, for: indexPath) as! ProductItemCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return .init(width: (view.frame.width / 2) - 10 , height: view.frame.height / 2)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (self.view.frame.width / 2) - 20, height: (self.view.frame.height / 2) - 15 )
//        return
        //        view.frame.width - 2 * padding
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: productCatHeader, for: indexPath) as! ProductsHeaderView
        return header
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    
}
