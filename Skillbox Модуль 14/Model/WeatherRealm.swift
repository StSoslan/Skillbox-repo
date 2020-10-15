//
//  WeatherRealm.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import Foundation
import RealmSwift

class Day: Object {
    
    @objc dynamic var date: NSDate!
    @objc dynamic var minTemp = 0.0
    @objc dynamic var maxTemp = 0.0
}
