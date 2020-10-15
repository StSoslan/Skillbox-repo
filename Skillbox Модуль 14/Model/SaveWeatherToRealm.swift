//
//  SaveWeatherToRealm.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 13.10.2020.
//

import Foundation
import RealmSwift

class SaveWeatherToRealm {
    
    let realm = try! Realm()
    var weather: [SevenDaysWeather] = []
    var temporaryVar = 0
    let loader = SevenDaysWeatherLoader()
    
    func weatherLoading(){
        loader.delegate = self
        loader.loadWeather()
    }
    
    func saveWeather() {
        weatherLoading()
        for _ in weather {
            let days = weather[temporaryVar]
            let date = NSDate(timeIntervalSince1970: Double(days.dt))
            try! realm.write(){
                let weatherForDay = Day()
                weatherForDay.date = date
                weatherForDay.minTemp = days.minTemp
                weatherForDay.maxTemp = days.maxTemp
            }
            temporaryVar += 1
        }
    }
}

extension SaveWeatherToRealm: SevenDaysWeatherLoaderDelegate{
    func loaded(weather: [SevenDaysWeather]){
        self.weather = weather
    }
}
