//
//  RealmPersistance.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import Foundation
import RealmSwift

class RealmPersistance{
    
    static let shared = RealmPersistance()
    
    let realm = try! Realm()
    
    lazy var toDoTasks: Results<Task> = { self.realm.objects(Task.self) }()
}
