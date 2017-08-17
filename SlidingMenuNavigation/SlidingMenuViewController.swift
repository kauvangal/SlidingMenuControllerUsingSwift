/*
 
 Copyright (c) 2014 Vijay Kauvangal <vappflakes@gmail.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 */

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
        self.view.backgroundColor = UIColor.red
        self._firstTime=true
    }
    
    func setupScrollView(){
        _scrollView = UIScrollView(frame: CGRect.zero)
        _scrollView?.translatesAutoresizingMaskIntoConstraints = false
        _scrollView?.isPagingEnabled = true
        self.view.addSubview(_scrollView!)
        
        let viewsDictionary = ["scrollView":self._scrollView!]
        //Set Horizontal Constraints
        let horizontalConstraints:[AnyObject]! = NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views:viewsDictionary)
        self.view.addConstraints(horizontalConstraints as! [NSLayoutConstraint])
        //Set Vertical Constraints
        let verticalConstraints:[AnyObject]! = NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil,views:viewsDictionary)
        self.view.addConstraints(verticalConstraints as! [NSLayoutConstraint])
    }
    
    func setupViewController(){
        self.addViewController(viewController: self.leftViewController!);
        self.addViewController(viewController: self.mainViewController!);
        let viewsDictionary = ["leftView":self.leftViewController?.view,"mainView":self.mainViewController?.view,"outerView":self.view];
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|[leftView][mainView(==outerView)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views:viewsDictionary as Any as! [String : Any])
        self.view.addConstraints(horizontalConstraints)
        
        let leftViewConstraint = NSLayoutConstraint(item:self.leftViewController!.view,
                                                    attribute: NSLayoutAttribute.width,
                                                    relatedBy: NSLayoutRelation.equal,
                                                    toItem: self.view,
                                                    attribute: NSLayoutAttribute.width,
                                                    multiplier: 1.0,
                                                    constant:-self.offSet)
        
        self.view.addConstraint(leftViewConstraint);
        
        let leftViewVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[leftView(==outerView)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views:viewsDictionary as Any as! [String : Any])
        self.view.addConstraints(leftViewVerticalConstraints)
        
        let mainViewVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[mainView(==outerView)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views:viewsDictionary as Any as! [String : Any])
        self.view.addConstraints(mainViewVerticalConstraints)
    }
    
    func addViewController(viewController:UIViewController){
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        _scrollView?.addSubview(viewController.view)
        self.addChildViewController(viewController);
        viewController.didMove(toParentViewController: self);
    }
    
    func isMenuOpen() -> Bool{
        let contentOffSet = self._scrollView?.contentOffset
        return (contentOffSet?.x == 0)
    }
    
    func closeMenu(animated:Bool){
        var contentOffSet = self._scrollView?.contentOffset
        let width = self.view.bounds.width
        contentOffSet?.x = width - self.offSet
        self._scrollView?.setContentOffset(contentOffSet!, animated: true)
    }
    
    func openMenu(animated:Bool) {
        self._scrollView?.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func toggleMenu() {
        self.isMenuOpen() ? self.closeMenu(animated: true) : self.openMenu(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if self._firstTime {
            self._firstTime = false
            self.closeMenu(animated:false)
        }
    }
}


