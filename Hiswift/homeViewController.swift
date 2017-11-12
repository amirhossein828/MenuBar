//
//  ViewController.swift
//  HiSwift
//
//  Created by seyedamirhossein hashemi on 2017-10-28.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    let cellId = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuBar()
    }
    
     weak var myPgeController : HomeSelectItemOfPageControllerDelegate?
    
    // this method make the icones white when the scrolling happen (target of collection view)
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
        myPgeController?.selectItem(item: Int(index))
        
    }
    
    
    
    
     lazy var menuBar : MenuBar = {
        let mb = MenuBar()
        mb.homeControllerDelegate = self
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
    
    
    public  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    // avoid scrolling when it reaches to starting page edge
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ( scrollView.contentOffset.x < 0 || scrollView.contentOffset.x > self.view.frame.maxX * 2) {
            scrollView.panGestureRecognizer.isEnabled = false
            scrollView.panGestureRecognizer.isEnabled = true
        }
    }
    

    public  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let colors: [UIColor] = [UIColor.blue,.brown,.gray]
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width,height: collectionView.bounds.height)
    }


}

extension HomeViewController : HomeViewContollerScrollToMenuDelegate {
    // Delegate the changing of the pages inside HomeViewController to the menu bar
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
}


// protocol which defines a method which delegate the changing of the pages inside HomeViewController to the menu bar
protocol HomeViewContollerScrollToMenuDelegate {
    func scrollToMenuIndex(menuIndex: Int)
}





