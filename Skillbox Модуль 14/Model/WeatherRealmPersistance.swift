//
//  WeatherRealmPersistance.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 13.10.2020.
//

import Foundation
import RealmSwift

class WeatherRealmPersistance {
    
    var weatherSaved = 0
    
    static let shared = WeatherRealmPersistance()
    
    let weatherRealm = try! Realm()

    lazy var days: Results<Day> = { self.weatherRealm.objects(Day.self) }()
    
    func saveDay(new: Day) {
        
        if WeatherRealmPersistance.shared.days.count == 8 {
            
            let day = WeatherRealmPersistance.shared.days[weatherSaved]

            try! weatherRealm.write {
                day.date = new.date
                day.minTemp = new.minTemp
                day.maxTemp = new.maxTemp
            }
            weatherSaved += 1
        } else {
            try! weatherRealm.write {
                weatherRealm.add(new)
            }
            
        }
    }
}
