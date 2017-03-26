//
//  TableViewCell.swift
//  FitSave
//
//  Created by Gaeun Kim on 3/25/17.
//  Copyright © 2017 HSHacks Team. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    var myLabel1: UILabel!
    var myLabel2: UILabel!
    var brandImage: UIImage!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let gap : CGFloat = 13
        let labelHeight: CGFloat = 30
        let labelWidth: CGFloat = 150
        let label2Y : CGFloat = gap + labelHeight
        let imageSizeX : CGFloat = 105
        let imageSizeY : CGFloat = 61
        
        myLabel1 = UILabel()
        myLabel1.frame = CGRectMake(imageSizeX+gap*2, gap, labelWidth, labelHeight)
        myLabel1.textColor = UIColor.black
        contentView.addSubview(myLabel1)
        
        myLabel2 = UILabel()
        myLabel2.frame = CGRectMake(imageSizeX+gap*2, label2Y, labelWidth, labelHeight)
        myLabel2.textColor = UIColor.black
        contentView.addSubview(myLabel2)
        
        brandImage = UIImage(named: "NikeLogo")!
        let BrandImageView = UIImageView(image: brandImage)
        BrandImageView.frame = CGRectMake(gap, gap, imageSizeX, imageSizeY)
        contentView.addSubview(BrandImageView)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
}
