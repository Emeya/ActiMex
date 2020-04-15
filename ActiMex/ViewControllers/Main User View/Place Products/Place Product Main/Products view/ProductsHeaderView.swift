//
//  ProductsHeaderView.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 14/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit


fileprivate let catProdId = "catProdId"
class ProductsHeaderView: UICollectionReusableView {
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let productCategoryLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Category"
        lb.textColor = Theme.current.textColor
        let customFont = UIFont(name: Theme.current.fontBold, size: 34)
        lb.font = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: customFont!)
        lb.adjustsFontForContentSizeCategory = true
        lb.textAlignment = .left
        lb.numberOfLines = 1
        return lb
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = true
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        return cv
    }()
    
    var products:[String]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        collectionView.register(categoryProductCell.self, forCellWithReuseIdentifier: catProdId)
        
        products = [ "img1", "img2", "img3", "img4" ]
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension ProductsHeaderView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: catProdId, for: indexPath) as! categoryProductCell
        cell.restaurantImage.image = UIImage(named: products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        collectionView.collectionViewLayout = layout
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20 , bottom: 10, right: 20)
        return CGSize(width: self.collectionView.frame.height -  20, height: self.collectionView.frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
