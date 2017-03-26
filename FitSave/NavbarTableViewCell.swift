//
//  NavbarTableViewCell.swift
//  FitSave
//
//  Created by Gaeun Kim on 3/25/17.
//  Copyright © 2017 HSHacks Team. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class NavbarTableViewCell: UITableViewCell {
    
    var pageName: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let labelHeight: CGFloat = 30
        let labelWidth: CGFloat = 150
        
        pageName = UILabel()
        pageName.frame = CGRectMake(20, 13, labelWidth, labelHeight)
        pageName.textColor = UIColor.black
        contentView.addSubview(pageName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
}

