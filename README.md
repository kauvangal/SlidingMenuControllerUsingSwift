Sliding MenuController Using Swift Language
===============================

This is a sample app to demonstrate sliding menu controller using Apple's new language SWIFT
Based upon inspiration from RayWenderlich articles

Project Files

1. Main.Storyboard
2. AppDelegate.swift
3. SlidingMenuViewController.swift
4. CountriesViewController.swift
5. ContinentViewController.swift - sample file
6. MenuViewController - menu item


Adding a new view controller

1. Story Board
  - Set Identifier for the view controller, so you can instantitateViewControllerWithIdentifier
  - Embed in Navigation controller (optional step)
  - Add a Menu Item (Bar Button Item)
  - Connect IBOutlets, IBAction and set tableview delegate to the view controller
2. Code
  - Add a delegate in the new controller
  - Add a delegate method in the menu view controller
  - Add it in the App delegate


