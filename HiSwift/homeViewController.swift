//
//  ViewController.swift
//  HiSwift
//
//  Created by seyedamirhossein hashemi on 2017-10-28.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    let cellId = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupMenuBar()
    }
    
    func setupCollectionView() {
        
    }
    
     let menuBar : MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    // This method put the menubar on top of the view
    private func setupMenuBar() {
        view.addSubview(menuBar)
        // add some constraint to put the menu bar on top
        view.addConstraintsWithFormat(format:  "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(70)]", views: menuBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let colors: [UIColor] = [UIColor.blue,.brown,.gray]
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width,height: collectionView.bounds.height)
    }


}

