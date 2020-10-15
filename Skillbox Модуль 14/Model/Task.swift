//
//  Task.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import Foundation
import RealmSwift

class Task: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var isFinish = false
}
