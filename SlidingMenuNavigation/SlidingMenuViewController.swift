//
//  ViewController.swift
//  SlidingMenuNavigation
//
//  Created by Vijay Kauvangal on 8/31/14.
//  Copyright (c) 2014 Vijay Kauvangal. All rights reserved.
//

import UIKit

class SlidingMenuViewController: UIViewController {
    
    private var _leftViewController:UIViewController?
    private var _mainViewController:UIViewController?
    private var _gap:CGFloat = 50.0
    private var _scrollView:UIScrollView?
    private var _firstTime:Bool = true
    
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        

    }
    
    init(leftViewController:UIViewController, mainViewController:UIViewController, gap:CGFloat) {
        super.init()
        _leftViewController = leftViewController
        _mainViewController = mainViewController
        _gap = gap
        setupScrollView()
        setupViewController()
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
        self.addViewController(self._leftViewController!);
        self.addViewController(self._mainViewController!);
        let viewsDictionary = ["leftView":self._leftViewController?.view,"mainView":self._mainViewController?.view,"outerView":self.view];
        let horizontalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("|[leftView][mainView(==outerView)]|", options: NSLayoutFormatOptions(0), metrics: nil, views:viewsDictionary)
         self.view.addConstraints(horizontalConstraints)
        
        let leftViewConstraint = NSLayoutConstraint(item:_leftViewController?.view!,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view!,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant:-self._gap)
        
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
    
    
   
    
}

