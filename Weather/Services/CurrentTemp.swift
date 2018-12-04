//
//  CurrentTemp.swift
//  Weather
//
//  Created by Ahmed Mohamed El-Desouky on 10/13/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//
import Foundation
import Alamofire

class CurrentTemp{
    var city:String!
    var day:String!
    var tempdegree=0
    var statuas:String!
    
    func showWeatherTemp(completed:@escaping DownloadComplete)  {
        Alamofire.request("\(WetherURL)").responseJSON { (response) in
            let result=response.result
            
            if let diction=result.value as? [String:Any]{
                if let name=diction["name"] as? String{
                    self.city=name.capitalized
                }
                if let main=diction["main"] as? [String:Any]{
                    if let temp=main["temp"] as? Double{
                        self.tempdegree=Int(temp-275.13)
                    }
                    if let weather=diction["weather"] as? [[String:Any]] {
                        if let main=weather[0]["main"] as? String{
                            self.statuas=main
                        }
                    }
                }
            }
            
            completed()
            
        }
        }
    }



