Sliding MenuController Using Swift Language
===============================

This is a sample app to demonstrate sliding menu controller using Apple's new language SWIFT
Based upon inspiration from RayWenderlich articles

![My image](https://github.com/kauvangal/SlidingMenuControllerUsingSwift/blob/master/SlidingMenuNavigation/ScreenShots.gif)

Project Files

1. Main.Storyboard
2. AppDelegate.swift
3. SlidingMenuViewController.swift
4. CountriesViewController.swift
5. ContinentViewController.swift - sample file
6. MenuViewController - menu item
7. HomeViewController -> Manages menu & other controllers interactions. This can be a login page to in your app

<h4>Adding a new view controller</h4>

1. Story Board
  - Set Identifier for the view controller, so you can instantitateViewControllerWithIdentifier
  - Embed in Navigation controller (optional step)
  - Add a Menu Item (Bar Button Item)
  - Connect IBOutlets, IBAction and set tableview delegate to your view controller
2. Code
  - Add a delegate in the new controller
  - Add a delegate method in the menu view controller
  - Add it in the HomeViewController


<h4> Known Issues: Build errors in Latest XCode Beta 6 released on Sep 2 2014.Fixing it.
