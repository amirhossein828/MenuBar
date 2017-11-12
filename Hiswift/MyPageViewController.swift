//
//  MyPageViewController.swift
//  MenuBar
//
//  Created by seyedamirhossein hashemi on 2017-11-11.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    var delegate : HomeSelectItemOfPageControllerDelegate?

    @IBOutlet weak var myPageController: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

    }
    func myPageControllerFunc(item : Int){
        self.myPageController.currentPage = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension MyPageViewController : HomeSelectItemOfPageControllerDelegate {
    func selectItem(item : Int) {
        self.myPageController.currentPage = item
    }
}

protocol HomeSelectItemOfPageControllerDelegate : class {
    func selectItem(item : Int)
}


