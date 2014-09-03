//
//  CountriesViewController.swift
//  SlidingMenuNavigation
//
//  Created by Vijay Kauvangal on 9/1/14.
//  Copyright (c) 2014 Vijay Kauvangal. All rights reserved.
//

import UIKit

@objc protocol CountriesViewControllerDelegate {
    func countriesViewControllerDidTapMenuButton(viewController:CountriesViewController)
}

class CountriesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView:UITableView!
    private let countries:[String] = ["USA","India","China","Canada","Brazil","Australia","Mexico"]
    var delegate:CountriesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell:UITableViewCell! = self.tableView .dequeueReusableCellWithIdentifier("CountryCell")
            as UITableViewCell
        cell.textLabel.text = self.countries[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    @IBAction func openMenu(sender: AnyObject){
        self.delegate?.countriesViewControllerDidTapMenuButton(self)
    }

}
