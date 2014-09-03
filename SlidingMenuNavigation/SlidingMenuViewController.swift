//
//  ViewController.swift
//  SlidingMenuNavigation
//
//  Created by Vijay Kauvangal on 8/31/14.
//  Copyright (c) 2014 Vijay Kauvangal. All rights reserved.
//

import UIKit

class SlidingMenuViewController: UIViewController {
    
    var leftViewController:UIViewController?
    var mainViewController:UIViewController?
    var offSet:CGFloat = 50.0
    private var _scrollView:UIScrollView?
    private var _firstTime:Bool = true
    
  

    override func viewDidLoad() {
        setupScrollView()
        setupViewController()
        self.view.backgroundColor = UIColor.redColor()
        self._firstTime=true
    }
        
    func setupScrollView(){
        _scrollView = UIScrollView(frame: CGRectZero)
        _scrollView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        _scrollView?.pagingEnabled = true
        self.view.addSubview(_scrollView!)

        let viewsDictionary = ["scrollView":self._scrollView!]
        let horizontalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: NSLayoutFormatOptions(0), metrics: nil, views:viewsDictionary)

  
        self.view.addConstraints(horizontalConstraints)
        
        let verticalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: NSLayoutFormatOptions(0), metrics: nil,views:viewsDictionary)
        self.view.addConstraints(verticalConstraints)
        
    }
    
    func setupViewController(){
        self.addViewController(self.leftViewController!);
        self.addViewController(self.mainViewController!);
        let viewsDictionary = ["leftView":self.leftViewController?.view,"mainView":self.mainViewController?.view,"outerView":self.view];
        let horizontalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("|[leftView][mainView(==outerView)]|", options: NSLayoutFormatOptions(0), metrics: nil, views:viewsDictionary)
         self.view.addConstraints(horizontalConstraints)
        
        let leftViewConstraint = NSLayoutConstraint(item:leftViewController?.view!,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view!,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant:-self.offSet)
        
        self.view.addConstraint(leftViewConstraint);
        
        let leftViewVerticalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("V:|[leftView(==outerView)]|", options: NSLayoutFormatOptions(0), metrics: nil, views:viewsDictionary)
        self.view.addConstraints(leftViewVerticalConstraints)
        
        let mainViewVerticalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("V:|[mainView(==outerView)]|", options: NSLayoutFormatOptions(0), metrics: nil, views:viewsDictionary)
        self.view.addConstraints(mainViewVerticalConstraints)
    }
    
    func addViewController(viewController:UIViewController){
        viewController.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        _scrollView?.addSubview(viewController.view)
        self.addChildViewController(viewController);
        viewController.didMoveToParentViewController(self);
    }
    
    func isMenuOpen() -> Bool{
        let contentOffSet = self._scrollView?.contentOffset
        return (contentOffSet?.x == 0)
    }
    
    func closeMenu(animated:Bool){
        var contentOffSet = self._scrollView?.contentOffset
        contentOffSet?.x = CGRectGetWidth(self.view.bounds) - self.offSet
        self._scrollView?.setContentOffset(contentOffSet!, animated: true)
    }
    
    func openMenu(animated:Bool) {
        self._scrollView?.setContentOffset(CGPointZero, animated: true)
    }
    
    func toggleMenu() {
        if self.isMenuOpen() {
            self.closeMenu(true)
        }else {
            self.openMenu(true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if self._firstTime {
            self._firstTime = false
            self.closeMenu(false)
        }
    }
}

