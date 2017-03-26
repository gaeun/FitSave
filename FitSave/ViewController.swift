//
//  ViewController.swift
//  FitSave
//
//  Created by Gaeun Kim on 3/25/17.
//  Copyright © 2017 HSHacks Team. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LeftNavigationViewControllerDelegate {
    
    var myTableView: UITableView  =   UITableView()
    var itemsToLoad: [String] = ["Nike", "Chipotle", "Boething"]
    var fitnessPointsArray: [String] = ["75,000 points", "25,000 points", "10,000 points"]
    let leftNavigator = LeftNavigationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        self.view.backgroundColor = UIColor(red:0.62, green:0.86, blue:0.62, alpha:1.0)
        
        // Deals Near You Label
        let label = UILabel(frame: CGRect(x: 0, y: 252, width: screenWidth, height: 40))
        label.backgroundColor = UIColor(red:0.41, green:0.55, blue:0.41, alpha:1.0)
        label.textAlignment = .center
        label.text = "Deals Near You"
        label.font = UIFont(name: "OpenSans", size: 16)
        label.textColor = UIColor.white
        self.view.addSubview(label)
        
        // Images
        let CaloriesImage: UIImage = UIImage(named: "CaloriesIcon")!
        let CaloriesImageView = UIImageView(image: CaloriesImage)
        self.view.addSubview(CaloriesImageView)
        CaloriesImageView.frame = CGRectMake(46, 101, 25, 28)
        
        let OvalImage: UIImage = UIImage(named: "Oval")!
        let OvalImageView = UIImageView(image: OvalImage)
        self.view.addSubview(OvalImageView)
        OvalImageView.frame = CGRectMake(113, 51, 150, 150)
        
        let StepsImage: UIImage = UIImage(named: "StepsIcon")!
        let StepsImageView = UIImageView(image: StepsImage)
        self.view.addSubview(StepsImageView)
        StepsImageView.frame = CGRectMake(301, 98, 36, 28)
        //
        
        // Labels in header
        let fitnessPointsLabel = UILabel(frame: CGRect(x: 134, y: 128, width: 108, height: 24))
        fitnessPointsLabel.textAlignment = .center
        fitnessPointsLabel.text = "fitness points"
        fitnessPointsLabel.textColor = UIColor.white
        fitnessPointsLabel.font = UIFont(name: "OpenSans-Light", size: 18)
        self.view.addSubview(fitnessPointsLabel)
        
        myTableView.frame = CGRectMake(0, 292, screenWidth, screenHeight-292);
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        self.view.addSubview(myTableView)
        
        // Button
        let btn: UIButton = UIButton(frame: CGRect(x: screenWidth-70, y: screenHeight-70, width: 50, height: 50))
        btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        btn.backgroundColor = UIColor(red:0.41, green:0.55, blue:0.41, alpha:1.0)
        btn.setImage(UIImage(named:"Menu"), for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
        
        setupSideMenu()
    }
    
    fileprivate func setupSideMenu() {
        leftNavigator.delegate = self
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: leftNavigator)
        menuLeftNavigationController.leftSide = true
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the View Controller it displays!
        SideMenuManager.menuAddPanGestureToPresent(toView: leftNavigator.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: leftNavigator.navigationController!.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func buttonAction(sender: UIButton!) {
        setupSideMenu()
        self.present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemsToLoad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = TableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier") as TableViewCell
        cell.myLabel1.text = itemsToLoad[indexPath.row]
        cell.myLabel1.font = UIFont(name: "OpenSans-Light", size: 17)
        cell.myLabel2.text = fitnessPointsArray[indexPath.row]
        cell.myLabel2.font = UIFont(name: "OpenSans-Light", size: 14)
        cell.getBrandImage(x: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func onClickSignup() {
        dismiss(animated: true, completion: nil)
        let signupView = SignUpViewController()
        self.present(signupView, animated: true, completion: nil)
    }
    
}
