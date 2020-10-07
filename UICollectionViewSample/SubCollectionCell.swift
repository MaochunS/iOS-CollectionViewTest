//
//  SubCollectionCell.swift
//  UICollectionViewSample
//
//  Created by maochun on 2020/10/6.
//

import UIKit

class SubCollectionCell: UICollectionViewCell {
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.textAlignment = NSTextAlignment.left
        
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        
        
        self.addSubview(label)
        
        
        NSLayoutConstraint.activate([
        
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
         
        
        ])
        
    
        return label
    }()
    
    
    lazy var theCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        //layout.itemSize = CGSize(width: (Int(self.view.frame.width) - (numOfItems + 1) * 18)/numOfItems, height: 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInsetReference = .fromSafeArea
        //layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.scrollDirection = .horizontal
      
        
        let theView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        theView.translatesAutoresizingMaskIntoConstraints = false
        theView.dataSource = self
        theView.delegate = self
        theView.backgroundColor = .white
        theView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.addSubview(theView)
        
        
        NSLayoutConstraint.activate([
            theView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            theView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            theView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            theView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            //theView.heightAnchor.constraint(equalToConstant: 360)
        ])
        
        
        return theView
        
    }()
    
    let numOfItems = 10
    let numOfSections = 1
    let itemSize = CGSize(width: 100, height: 120)
    
    func setup(title:String, numOfItems:Int){
        self.titleLabel.text = title
        let _ = self.theCollectionView
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension SubCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.orange : UIColor.brown
        return cell

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    
        return itemSize
    }
    
    
}
