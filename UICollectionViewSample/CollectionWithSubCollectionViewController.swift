//
//  CollectionWithSubCollectionViewController.swift
//  UICollectionViewSample
//
//  Created by maochun on 2020/10/6.
//

import UIKit

class CollectionWithSubCollectionViewController: UIViewController {
    
    let numOfItems = 1
    let numOfSections = 15
    let itemHeight = 160
    let lineSpace = 25

    
    lazy var theCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        layout.sectionInsetReference = .fromSafeArea
        
        let theView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        theView.translatesAutoresizingMaskIntoConstraints = false
        theView.dataSource = self
        theView.delegate = self
        theView.backgroundColor = .white
        theView.register(SubCollectionCell.self, forCellWithReuseIdentifier: "SubCell")
        self.view.addSubview(theView)
        
        
        NSLayoutConstraint.activate([
            theView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            theView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10),
            theView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            theView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            //theView.heightAnchor.constraint(equalToConstant: 360)
        ])
        
        
        return theView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        let _ = self.theCollectionView
    }
}



extension CollectionWithSubCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCell", for: indexPath)
        cell.backgroundColor = .black
        
        if let subcell = cell as? SubCollectionCell{
            subcell.setup(title: "Title \(indexPath.section)", numOfItems: 10)
            return subcell
        }
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(lineSpace)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding = lineSpace * (numOfItems - 1)
        let availableWidth = Int(collectionView.bounds.size.width) - padding
        let width = availableWidth / numOfItems

        return CGSize(width: width, height: itemHeight)
    }
    
    
}
