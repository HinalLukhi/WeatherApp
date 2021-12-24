//
//  ViewController.swift
//  WeatherApp
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var WeatherArray = [WeatherData]()
    
    let SearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Enter Place Name"
        sb.barTintColor = UIColor.white
        sb.layer.borderWidth = 1
        sb.layer.borderColor = UIColor.gray.cgColor
        return sb
    }()
    
    let view1: UIView = {
        let vu = UIView()
        vu.backgroundColor = .blue
        vu.backgroundColor = .white
        vu.layer.cornerRadius = 10
        return vu
    }()
    
    /*  let blurvu: UIView = {
     let vu = UIView()
     vu.backgroundColor = .init(red: 0.918, green: 0.918, blue: 0.918, alpha: 0.5)
     return vu
     }()*/
    
    private let label1: UILabel = {
        let lbl = UILabel()
        lbl.text = "Location"
        lbl.font = UIFont(name: "arial", size: 28)
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor(red: 67/255, green: 117/255, blue: 191/255, alpha: 1.0)
        lbl.textColor = .white
        return lbl
    }()
    
    private let label2: UILabel = {
        let lbl = UILabel()
        lbl.text = "DateTime"
        lbl.font = UIFont(name: "arial", size: 20)
        return lbl
    }()
    
    private let label3: UILabel = {
        let lbl = UILabel()
        lbl.text = "TimeZone"
        lbl.font = UIFont(name: "arial", size: 20)
        return lbl
    }()
    
    private let label4: UILabel = {
        let lbl = UILabel()
        lbl.text = "Temprature"
        lbl.font = UIFont(name: "arial", size: 26)
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor(red: 67/255, green: 117/255, blue: 191/255, alpha: 1.0)
        lbl.textColor = .white
        return lbl
    }()
    
    private let label5: UILabel = {
        let lbl = UILabel()
        lbl.text = "Humidity"
        lbl.font = UIFont(name: "arial", size: 20)
        return lbl
    }()
    
    private let label6: UILabel = {
        let lbl = UILabel()
        lbl.text = "Cloud"
        lbl.font = UIFont(name: "arial", size: 20)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(SearchBar)
        SearchBar.delegate = self
        view.backgroundColor = .white
        view.addSubview(view1)
        //   view.addSubview(blurvu)
        view1.addSubview(label1)
        view1.addSubview(label2)
        view1.addSubview(label3)
        view1.addSubview(label4)
        view1.addSubview(label5)
        view1.addSubview(label6)
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "back2")!)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SearchBar.frame = CGRect(x: 10, y: 30, width: view.width-20, height: 40)
        view1.frame = CGRect(x: 10, y: 100, width: view.width, height: view.height - 80)
        
        label1.frame = CGRect(x: 20, y: 10, width: view.width-80, height: 40)
        label2.frame = CGRect(x: 20, y: label1.bottom+20, width: view.width-40, height: 20)
        label3.frame = CGRect(x: 20, y: label2.bottom+20, width: view.width-40, height: 20)
        label4.frame = CGRect(x: 20, y: label3.bottom+40, width: view.width-80, height: 40)
        label5.frame = CGRect(x: 20, y: label4.bottom+30, width: view.width-40, height: 20)
        label6.frame = CGRect(x: 20, y: label5.bottom+20, width: view.width-40, height: 20)
    }
    /*var last_updated = ""
     var is_day:Int
     var temp_c:Float
     var temp_f :Float
     var condition: Condition
     var wind_mph:Float
     var wind_kph:Float
     var pressure_mb:Int
     var pressure_in:Float
     var humidity:Int
     var cloud:Int
     var uv:Float*/
    
    func show(name:String){
        WeatherArray = APIHandler.shared.search_weather(with: name)
        for i in WeatherArray {
            label1.text = "\(i.location.name),\(i.location.country)"
            label2.text = "DateTime \t \(i.location.localtime)"
            label3.text = "TimeZone \t \(i.location.tz_id)"
            
            label4.text = "\(i.current.temp_c) C | \(i.current.temp_f) F"
            label5.text = "Humidity \t \(i.current.humidity)"
            label6.text = "Cloud \t \(i.current.cloud)"
        }
    }
}

extension ViewController: UISearchBarDelegate {
    /*func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        show(name: SearchBar.text!)
    }*/
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         show(name: SearchBar.text!)
    }
}

