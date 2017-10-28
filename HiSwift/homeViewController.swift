//
//  ViewController.swift
//  HiSwift
//
//  Created by seyedamirhossein hashemi on 2017-10-28.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuBar()
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


}

