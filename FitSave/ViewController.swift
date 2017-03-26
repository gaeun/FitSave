//
//  ViewController.swift
//  FitSave
//
//  Created by Gaeun Kim on 3/25/17.
//  Copyright © 2017 HSHacks Team. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myTableView: UITableView  =   UITableView()
    var itemsToLoad: [String] = ["Nike", "Chipotle", "Boething"]
    var fitnessPointsArray: [String] = ["75,000 points", "25,000 points", "10,000 points"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        // self.view.addSubview(navBar);
        // let navItem = UINavigationItem(title: "Dashboard");
        // navBar.setItems([navItem], animated: true);
        
        let btn: UIButton = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 50))
        btn.backgroundColor = UIColor.green
        btn.setTitle("Click Me", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get main screen bounds
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        myTableView.frame = CGRectMake(0, 292, screenWidth, screenHeight-292);
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        self.view.addSubview(myTableView)
        
    }
    
    func buttonAction(sender: UIButton!) {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight*0.1))
            self.view.addSubview(navBar);
            let navItem = UINavigationItem(title: "Dashboard");
            let navItem2 = UINavigationItem(title: "Dashboard2");
            navBar.setItems([navItem, navItem2], animated: true);
        }
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
    
}
