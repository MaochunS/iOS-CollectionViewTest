//
//  ViewController.swift
//  UICollectionViewSample
//
//  Created by maochun on 2020/10/6.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var button1 : UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Fixed Row Items", for: .normal)
        button.backgroundColor = .blue
        
        button.addTarget(self, action: #selector(button1Clicked), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -80),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        return button
        
    }()
    
    
    lazy var button2 : UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Fixed Item Size", for: .normal)
        button.backgroundColor = .blue
        
        button.addTarget(self, action: #selector(button2Clicked), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        return button
        
    }()
    
    
    lazy var button3 : UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Collect With Sub-collection", for: .normal)
        button.backgroundColor = .blue
        
        button.addTarget(self, action: #selector(button3Clicked), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 80),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let _ = self.button1
        let _ = self.button2
        let _ = self.button3
        
    }
    
    @objc func button1Clicked(){
        let vc = FixedRowItemViewController()
   
        self.navigationController?.pushViewController(vc, animated: true)
    }


    @objc func button2Clicked(){
        let vc = FixedItemSizeViewController()
   
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func button3Clicked(){
        let vc = CollectionWithSubCollectionViewController()
     
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

