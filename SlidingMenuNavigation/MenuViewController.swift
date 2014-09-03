//
//  MenuViewController.swift
//  SlidingMenuNavigation
//
//  Created by Vijay Kauvangal on 9/1/14.
//  Copyright (c) 2014 Vijay Kauvangal. All rights reserved.
//

import UIKit

@objc protocol MenuViewControllerDelegate {

  func menuViewControllerDidTapContinents(controller:MenuViewController)
  func menuViewControllerDidTapCountries(controller:MenuViewController)

}


class MenuViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView:UITableView!
    var delegate:MenuViewControllerDelegate?
    
    let menuItems:[String] = ["Continents", "Countries"];

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell:UITableViewCell! = self.tableView .dequeueReusableCellWithIdentifier("SettingsCell")
            as UITableViewCell
        cell.textLabel.text = self.menuItems[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        if indexPath.row == 0 {
           self.delegate?.menuViewControllerDidTapContinents(self)
        }
        
        if (indexPath.row == 1) {
            self.delegate?.menuViewControllerDidTapCountries(self)
        }
        
        
    }

}
