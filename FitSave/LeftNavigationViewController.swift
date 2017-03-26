//
//  LeftNavigationViewController.swift
//  FitSave
//
//  Created by Gaeun Kim on 3/25/17.
//  Copyright © 2017 HSHacks Team. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

protocol LeftNavigationViewControllerDelegate {
    func onClickSignup()
}

class LeftNavigationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var leftTableView: UITableView!
    var pages: [String] = ["Login test", "Logout", "Profile", "My Discounts"]
    let signupNavigator = SignUpViewController()
    var delegate: LeftNavigationViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame: CGRect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        leftTableView = UITableView(frame: frame)
        leftTableView.dataSource = self
        leftTableView.delegate = self
        self.view.addSubview(leftTableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return pages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = NavbarTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier") as NavbarTableViewCell
        cell.pageName.text = pages[indexPath.row]
        cell.pageName.font = UIFont(name: "OpenSans-Light", size: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0 :
                self.delegate.onClickSignup()
            case 1 :
                print("Row 1")
            case 2 :
                print("Row 2")
            case 3 :
                print("Row 2")
            default :
                print("Default")
        }
    }
}
