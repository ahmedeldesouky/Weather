//
//  rb.swift
//  Weather
//
//  Created by Ahmed Mohamed El-Desouky on 10/13/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//


import Foundation
import UIKit
@IBDesignable
class rb: UIButton {
    @IBInspectable var a:CGFloat=0{didSet{self.layer.cornerRadius=a}}
    
    @IBInspectable var b:CGFloat=0{didSet{self.layer.borderWidth=b}}
    
    @IBInspectable var c:UIColor=UIColor.clear{didSet{self.layer.borderColor=c.cgColor}}
}
