//
//  ApiHandler.swift
//  WeatherApp
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class APIHandler {
    static let shared = APIHandler()
    
    private init(){}
    
    func search_weather(with name:String) -> [WeatherData] {
        if let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=a4fca5e52d29494584f145216212207&q=\(name)&aqi=no"){
            do {
                let data = try Data(contentsOf: url)
                do{
                    let jsonWeather = try JSONDecoder().decode(WeatherData.self, from: data)
                    return  [jsonWeather]
                }catch {
                    print(error)
                }
                
            } catch {
                print("Error : Place name is incorrect !")
            }
        }
        return [WeatherData]()
    }
    
   
    
}
