//
//  CoreDataPersistance.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import Foundation
import CoreData

class CoreDataPersistance {
    
    static let shared = CoreDataPersistance()
    
    var moc: NSManagedObjectContext!
    
    var fetch: NSFetchRequest<Person> = Person.fetchRequest()
    
}
