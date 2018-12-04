//
//  File.swift
//  Weather
//
//  Created by Ahmed Mohamed El-Desouky on 10/13/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class bg: UIView {
    @IBInspectable var fircol:UIColor=UIColor.clear{didSet{viecol()}}
    @IBInspectable var secol:UIColor=UIColor.clear{didSet{viecol()}}
    @IBInspectable var thirdcol:UIColor=UIColor.clear{didSet{viecol()}}
    
    override class var layerClass:AnyClass {
        get{ return CAGradientLayer.self }
    }
    func viecol()  {
        let vie=self.layer as! CAGradientLayer
        vie.colors=[fircol.cgColor,secol.cgColor,thirdcol.cgColor]
        
    }
}
