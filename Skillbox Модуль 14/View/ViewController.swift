//
//  ViewController.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = Persistance.shared.userName
        lastNameTextField.text = Persistance.shared.userLastName
    }
    @IBAction func saveData(_ sender: Any) {
        Persistance.shared.userName = nameTextField.text!
        Persistance.shared.userLastName = lastNameTextField.text!
    }


}

