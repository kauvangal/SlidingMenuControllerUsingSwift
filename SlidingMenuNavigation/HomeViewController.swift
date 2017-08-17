//
//  HomeViewController.swift
//  SlidingMenuNavigation
//
//  Created by Vijay Kauvangal on 9/6/14.
//  Copyright (c) 2014 Vijay Kauvangal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
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
    
    @IBAction func openNavigation(sender: AnyObject){
        openSlidingNavigation()
    }
    
    private func openSlidingNavigation(){
        self.sideBarNavigationController = (mainStoryboard.instantiateViewController(withIdentifier: "SlidingMenuViewController") as! SlidingMenuViewController)
        
        self.countriesViewController = (mainStoryboard.instantiateViewController(withIdentifier: "CountriesViewController") as! CountriesViewController)
        self.countriesViewController?.delegate = self
        
        self.continentsViewController = (mainStoryboard.instantiateViewController(withIdentifier: "ContinentsViewController") as! ContinentsViewController)
        self.continentsViewController?.delegate = self
        
        self.oceansViewController = (mainStoryboard.instantiateViewController(withIdentifier: "OceansViewController") as! OceansViewController)
        self.oceansViewController?.delegate = self
        
        self.menuViewController = (mainStoryboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController)
        self.menuViewController?.delegate = self
        
        self.menuNav = UINavigationController(rootViewController: self.menuViewController!)
        self.pageNavigationController = UINavigationController(rootViewController: self.continentsViewController!)
        
        self.sideBarNavigationController?.leftViewController = self.menuNav
        self.sideBarNavigationController?.mainViewController = self.pageNavigationController
        self.sideBarNavigationController?.offSet = 50
        
        self.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(self.sideBarNavigationController!, animated: false, completion: nil)
    }
    
}

extension HomeViewController:CountriesViewControllerDelegate {
    func countriesViewControllerDidTapMenuButton(viewController: CountriesViewController) {
        self.sideBarNavigationController?.toggleMenu()
    }
}

extension HomeViewController:ContinentsViewControllerDelegate {
    func continentsViewControllerDidTapMenuButton(viewController: ContinentsViewController) {
        self.sideBarNavigationController?.toggleMenu()
    }
}

extension HomeViewController:OceansViewControllerDelegate {
    func oceansViewControllerDidTapMenuButton(viewController: OceansViewController) {
        self.sideBarNavigationController?.toggleMenu()
    }
}

extension HomeViewController: MenuViewControllerDelegate {
    
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
        self.sideBarNavigationController?.dismiss(animated: true, completion: nil)
    }
}


