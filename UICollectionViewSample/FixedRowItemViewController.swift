//
//  FixedRowItemViewController.swift
//  UICollectionViewSample
//
//  Created by maochun on 2020/10/6.
//

import UIKit

class FixedRowItemViewController: UIViewController{
    
    
    let numOfItems = 2
    let numOfSections = 55
    let itemHeight = 160
    
    lazy var theCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        //layout.itemSize = CGSize(width: (Int(self.view.frame.width) - (numOfItems + 1) * 18)/numOfItems, height: 50)
        //layout.minimumLineSpacing = 0
        //layout.minimumInteritemSpacing = 0
        layout.sectionInsetReference = .fromSafeArea
        //layout.scrollDirection = UICollectionView.ScrollDirection.vertical
      
        
        let theView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        theView.translatesAutoresizingMaskIntoConstraints = false
        theView.dataSource = self
        theView.delegate = self
        theView.backgroundColor = .white
        theView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
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


extension FixedRowItemViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding = 25 * (numOfItems - 1)
        let availableWidth = Int(collectionView.bounds.size.width) - padding
        let width = availableWidth / numOfItems

        return CGSize(width: width, height: itemHeight)
    }
    
    
}
