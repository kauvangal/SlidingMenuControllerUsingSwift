//
//  ContinentsViewController.swift
//  SlidingMenuNavigation
//
//  Created by Vijay Kauvangal on 9/1/14.
//  Copyright (c) 2014 Vijay Kauvangal. All rights reserved.
//

import UIKit

@objc protocol ContinentsViewControllerDelegate {
    func continentsViewControllerDidTapMenuButton(viewController:ContinentsViewController)
}

class ContinentsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView:UITableView!
    private let continents:[String] = ["Asia","Africa","Australia","North America","South America","Europe","Antartica"]
    var delegate:ContinentsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell:UITableViewCell! = self.tableView .dequeueReusableCellWithIdentifier("ContinentCell")
         as UITableViewCell
        cell.textLabel.text = self.continents[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.continents.count
    }
    
    @IBAction func openMenu(sender: AnyObject){
       self.delegate?.continentsViewControllerDidTapMenuButton(self)
    }
   
}
