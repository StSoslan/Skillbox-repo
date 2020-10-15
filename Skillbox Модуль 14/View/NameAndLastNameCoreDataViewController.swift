//
//  NameAndLastNameCoreDataViewController.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import UIKit

class NameAndLastNameCoreDataViewController: UIViewController {

    var persons = [Person]()
    
    var moc = CoreDataPersistance.shared.moc
    
    var personName: String?
    var personLastName: String?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        if nameTextField.text == "" && lastNameTextField.text != "" {
            nameTextField.placeholder = "Вы не ввели имя"
        } else if nameTextField.text != "" && lastNameTextField.text == ""{
            lastNameTextField.placeholder = "Вы не ввели фамилию"
        } else if nameTextField.text == "" && lastNameTextField.text == ""{
            nameTextField.placeholder = "Вы не ввели имя"
            lastNameTextField.placeholder = "Вы не ввели фамилию"
        } else{
            let nameToSave = nameTextField.text
            let lastNameToSave = lastNameTextField.text
            self.save(name: nameToSave!, lastName: lastNameToSave!)
        }
    }
    
    func save(name: String, lastName: String){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let person = Person(context: context)
        person.setValue(name, forKeyPath: "name")
        person.setValue(lastName, forKeyPath: "lastName")
        do {
            try context.save()
            print("Item saved")
        } catch {
            print("Error saving item with \(error)")
        }
        
        fetch()
    }
    
    func fetch(){
        
        let personRequest = CoreDataPersistance.shared.fetch
        
        do{
            try persons = moc!.fetch(personRequest)
            if persons.count > 0{
            let onePerson = persons[persons.count - 1]
            personName = onePerson.name!
            personLastName = onePerson.lastName!
            }
            print("Items fetched")
        } catch{
            print("Could not load data")
        }
//        if persons.count > 0{
//        let onePerson = persons[0]
//        personName = onePerson.name!
//        personLastName = onePerson.lastName!
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        moc = appDelegate?.persistentContainer.viewContext
        fetch()
        if personName != nil{
            nameTextField.text = personName
            lastNameTextField.text = personLastName
        }
    }
}
