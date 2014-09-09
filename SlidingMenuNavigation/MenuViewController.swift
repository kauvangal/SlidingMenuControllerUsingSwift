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

@objc protocol MenuViewControllerDelegate {

  func menuViewControllerDidTapContinents(controller:MenuViewController)
  func menuViewControllerDidTapCountries(controller:MenuViewController)
  func menuViewControllerDidTapOceans(controller:MenuViewController)
  func menuViewControllerDidClose();

}


class MenuViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView:UITableView!
    var delegate:MenuViewControllerDelegate?
    
    let menuItems:[String] = ["Continents", "Countries", "Oceans"];

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = self.tableView .dequeueReusableCellWithIdentifier("SettingsCell")
            as UITableViewCell
        cell.textLabel?.text = self.menuItems[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row{
        case 0:
             self.delegate?.menuViewControllerDidTapContinents(self)
        case 1:
            self.delegate?.menuViewControllerDidTapCountries(self)
        case 2:
            self.delegate?.menuViewControllerDidTapOceans(self)
        default:
            self.delegate?.menuViewControllerDidTapContinents(self) //We will go with the first tab

        }
        
    }
    
    @IBAction func closeButton(){
        self.delegate?.menuViewControllerDidClose()
    }

}
