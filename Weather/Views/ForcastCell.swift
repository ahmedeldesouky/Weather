//
//  ForcastCell.swift
//  Weather
//
//  Created by Ahmed Mohamed El-Desouky on 10/14/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import UIKit

class ForcastCell: UITableViewCell {
    @IBOutlet weak var imgN: UIImageView!
    @IBOutlet weak var dayN: UILabel!
    @IBOutlet weak var statuasN: UILabel!
    @IBOutlet weak var maxN: UILabel!
    @IBOutlet weak var minN: UILabel!
    
    func configureCell(forcast: Forcast) {
            minN.text="\(forcast.minTemp)"
            maxN.text="\(forcast.maxTemp)"
            statuasN.text=forcast.weathStat
            imgN.image=UIImage(named: forcast.weathStat)
            dayN.text=forcast.dayDate
        }
    }
 
