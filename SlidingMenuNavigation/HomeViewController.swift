//
//  HomeViewController.swift
//  SlidingMenuNavigation
//
//  Created by Vijay Kauvangal on 9/6/14.
//  Copyright (c) 2014 Vijay Kauvangal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,MenuViewControllerDelegate,CountriesViewControllerDelegate,ContinentsViewControllerDelegate,OceansViewControllerDelegate {

    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var sideBarNavigationController:SlidingMenuViewController?
    var countriesViewController:CountriesViewController?
    var continentsViewController:ContinentsViewController?
    var oceansViewController:OceansViewController?
    var menuViewController:MenuViewController?
    var menuNav:UINavigationController?
    var pageNavigationController:UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func continentsViewControllerDidTapMenuButton(viewController: ContinentsViewController) {
        self.sideBarNavigationController?.toggleMenu()
    }
    
    func countriesViewControllerDidTapMenuButton(viewController: CountriesViewController) {
        self.sideBarNavigationController?.toggleMenu()
    }
    
    func oceansViewControllerDidTapMenuButton(viewController: OceansViewController) {
        self.sideBarNavigationController?.toggleMenu()
    }
    
    func menuViewControllerDidTapContinents(controller: MenuViewController) {
        self.sideBarNavigationController?.toggleMenu()
        self.pageNavigationController?.setViewControllers([self.continentsViewController!], animated: true)
    }
    
    func menuViewControllerDidTapCountries(controller: MenuViewController) {
        self.sideBarNavigationController?.toggleMenu()
        self.pageNavigationController?.setViewControllers([self.countriesViewController!], animated: true)
    }
    
    func menuViewControllerDidTapOceans(controller:MenuViewController){
        self.sideBarNavigationController?.toggleMenu()
        self.pageNavigationController?.setViewControllers([self.oceansViewController!], animated: true)
    }
    
    func menuViewControllerDidClose(){
        self.sideBarNavigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func openSlidingNavigation(){
        self.sideBarNavigationController = (mainStoryboard.instantiateViewControllerWithIdentifier("SlidingMenuViewController") as SlidingMenuViewController)
        
        self.countriesViewController = (mainStoryboard.instantiateViewControllerWithIdentifier("CountriesViewController") as CountriesViewController)
        self.countriesViewController?.delegate = self
        
        self.continentsViewController = (mainStoryboard.instantiateViewControllerWithIdentifier("ContinentsViewController") as ContinentsViewController)
        self.continentsViewController?.delegate = self
        
        self.oceansViewController = (mainStoryboard.instantiateViewControllerWithIdentifier("OceansViewController") as OceansViewController)
        self.oceansViewController?.delegate = self
        
        self.menuViewController = (mainStoryboard.instantiateViewControllerWithIdentifier("MenuViewController") as MenuViewController)
        self.menuViewController?.delegate = self
        
        self.menuNav = UINavigationController(rootViewController: self.menuViewController)
        self.pageNavigationController = UINavigationController(rootViewController: self.continentsViewController)
        
        self.sideBarNavigationController?.leftViewController = self.menuNav
        self.sideBarNavigationController?.mainViewController = self.pageNavigationController
        self.sideBarNavigationController?.offSet = 50
        
        self.modalPresentationStyle = UIModalPresentationStyle.FullScreen
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(self.sideBarNavigationController, animated: false, completion: nil)
    }
    @IBAction func openNavigation(sender: AnyObject){
     
        openSlidingNavigation()
    }


}
