//
//  Forcast.swift
//  Weather
//
//  Created by Ahmed Mohamed El-Desouky on 09/16/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import Foundation
class Forcast{
    var dayDate:String!
    var weathStat:String!
    var maxTemp=""
    var minTemp=""
    
    init(weatherD:[String:Any]) {
        if let weather=weatherD["weather"] as? [[String:Any]] {
            if let main=weather[0]["main"] as? String{
                self.weathStat=main
            }
        }
        
        if let temp=weatherD["temp"] as? [String:Any]{
            if let low=temp["min"] as? Double {
                self.minTemp="\(Int(low-273.15))"
            }
            if let high=temp["max"] as? Double {
                self.maxTemp="\(Int(high-273.15))"
            }
        }
        
        if let date=weatherD["dt"] as? Double{
            let unixConvertedDate=Date(timeIntervalSince1970: date)
            let dateFormatter=DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self.dayDate=unixConvertedDate.daOfTheWeek()
            
            
        }
        
    }

}

extension Date{
    func daOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
        
    }
}

