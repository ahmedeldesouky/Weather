//
//  ViewController.swift
//  Weather
//
//  Created by Ahmed Mohamed El-Desouky on 10/13/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UISearchBarDelegate {
    
    @IBOutlet weak var cityN: UILabel!
    @IBOutlet weak var tempN: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var stat: UILabel!
    @IBOutlet weak var img: UIImageView!    
    @IBOutlet weak var table: UITableView!
    
    var curweath=CurrentTemp()
    var forc=[Forcast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        curweath.showWeatherTemp {
            
            self.DownloadForcastDate {
 
            self.updateUI()
            self.updateDate()
        }
        
    }
    }
    
    func updateDate(){
        let dateformatter=DateFormatter()
        dateformatter.dateStyle = .long
        dateformatter.timeStyle = .none
        let currentDate=dateformatter.string(from: Date())
        self.day.text=currentDate
        
        
    }
    
    func DownloadForcastDate(completed:@escaping DownloadComplete) {
        Alamofire.request("\(ForacastURL)").responseJSON { (response) in
            let result=response.result
            
            if let diction=result.value as? [String:Any]{
                if let list=diction["list"] as? [[String:Any]]{
                    for obj in list{
                        let fr=Forcast(weatherD: obj)
                        self.forc.append(fr)
                        print(obj)
                    }
                }
                self.table.reloadData()
    }
    
  completed()
        }
    }
    
    func updateUI(){
        tempN.text="\(self.curweath.tempdegree)"
        cityN.text=self.curweath.city
        stat.text=self.curweath.statuas
        img.image=UIImage(named: curweath.statuas)
    }
    
    
    }
    
    //MARK:- EXTENTION
extension
        ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?
            ForcastCell {
            let list = forc[indexPath.row]
            cell.configureCell(forcast: list)
            return cell
        }
        else{
            return ForcastCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forc.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    }


    


