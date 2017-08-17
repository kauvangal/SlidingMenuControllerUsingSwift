//
//  OceansViewController.swift
//  SlidingMenuNavigation
//
//  Created by Vijay Kauvangal on 9/6/14.
//  Copyright (c) 2014 Vijay Kauvangal. All rights reserved.
//

import UIKit

@objc protocol OceansViewControllerDelegate {
    func oceansViewControllerDidTapMenuButton(viewController:OceansViewController)
}


class OceansViewController: UIViewController {
    
    @IBOutlet var tableView:UITableView!
    private let oceans:[String] = ["Pacific Ocean","Atlantic Ocean","Indian Ocean","Arctic Ocean"]
    var delegate:OceansViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func openMenu(sender: AnyObject){
        self.delegate?.oceansViewControllerDidTapMenuButton(viewController:self)
    }
}

extension OceansViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = self.tableView .dequeueReusableCell(withIdentifier: "OceanCell")
        cell.textLabel?.text = self.oceans[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.oceans.count
    }
}

