//
//  SevenDaysWeather.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import Foundation
class SevenDaysWeather {
    let dt: Int
    let day: Double
    let maxTemp: Double
    let minTemp: Double
    
    init?(data: NSDictionary){
        guard
              let temp = data["temp"] as? NSDictionary,
              let dt = data["dt"] as? Int,
              let day = temp["day"] as? Double,
              let maxTemp = temp["max"] as? Double,
              let minTemp = temp["min"] as? Double else {
        return nil
        }
        
        self.dt = dt
        self.day = day
        self.maxTemp = maxTemp
        self.minTemp = minTemp
    }
}
