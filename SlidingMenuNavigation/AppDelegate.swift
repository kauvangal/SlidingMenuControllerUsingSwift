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

This code is written based upon inspiration from RayWenderlich Articles
www.raywenderlich.com

*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MenuViewControllerDelegate,CountriesViewControllerDelegate,ContinentsViewControllerDelegate {
                            
    var window: UIWindow?
    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var sideBarNavigationController:SlidingMenuViewController?
    var countriesViewController:CountriesViewController?
    var continentsViewController:ContinentsViewController?
    var menuViewController:MenuViewController?
    var menuNav:UINavigationController?
    var pageNavigationController:UINavigationController?
    
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
    
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.sideBarNavigationController = (mainStoryboard.instantiateViewControllerWithIdentifier("SlidingMenuViewController") as SlidingMenuViewController)
        
        self.countriesViewController = (mainStoryboard.instantiateViewControllerWithIdentifier("CountriesViewController") as CountriesViewController)
        self.countriesViewController?.delegate = self
        
        self.continentsViewController = (mainStoryboard.instantiateViewControllerWithIdentifier("ContinentsViewController") as ContinentsViewController)
        self.continentsViewController?.delegate = self
        
        self.menuViewController = (mainStoryboard.instantiateViewControllerWithIdentifier("MenuViewController") as MenuViewController)
        self.menuViewController?.delegate = self
        
        self.menuNav = UINavigationController(rootViewController: self.menuViewController)
        self.pageNavigationController = UINavigationController(rootViewController: self.continentsViewController)
        
        self.sideBarNavigationController?.leftViewController = self.menuNav
        self.sideBarNavigationController?.mainViewController = self.pageNavigationController
        self.sideBarNavigationController?.offSet = 50
        
        self.window!.rootViewController = self.sideBarNavigationController
        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func continentsViewControllerDidTapMenuButton(viewController: ContinentsViewController) {
        self.sideBarNavigationController?.toggleMenu()
    }
    
    func countriesViewControllerDidTapMenuButton(viewController: CountriesViewController) {
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
}

