//
//  Persistance.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import Foundation

class Persistance{
    static let shared = Persistance()
    
    private let kUserNameKey = "Persistance.kUserNameKey"
    
    private let kUserLastNameKey = "Persistance.kUserLastNameKey"
    
    var userName: String?{
        set { UserDefaults.standard.set(newValue, forKey: kUserNameKey) }
        get { return UserDefaults.standard.string(forKey: kUserNameKey) ?? "" }
    }
    
    var userLastName: String?{
        set { UserDefaults.standard.set(newValue, forKey: kUserLastNameKey) }
        get { return UserDefaults.standard.string(forKey: kUserLastNameKey) ?? "" }
    }
}
