//
//  NewTaskViewController.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import UIKit

protocol NewTaskViewControllerDelegate {
    func reloadData()
}

class NewTaskViewController: UIViewController {

    let realm = RealmPersistance.shared.realm
    var delegate: NewTaskViewControllerDelegate?
    var task: Task?
    
    @IBAction func readyButton(_ sender: Any) {
        
        if let task = task {
           
            print("task.id>", task.id)
            let workouts = realm.objects(Task.self).filter("id = %@", task.id)
            let realm = RealmPersistance.shared.realm
            if let workout = workouts.first {
                try! realm.write {
                    workout.name = newTaskTextField.text ?? ""
                }
            }
            delegate?.reloadData()
            
            dismiss(animated: true, completion: nil)
            
        } else {
            
            if newTaskTextField.text != "" {
                try! realm.write(){
                    let newTask = Task()
                    newTask.name = newTaskTextField.text!
                    newTask.isFinish = false
                    newTask.id = String(Int.random(in: 12...99999))
                    print("newTask.id>", newTask.id)
                    realm.add(newTask)
                }
                delegate?.reloadData()
                dismiss(animated: true, completion: nil)
                
            } else {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
//    @IBOutlet weak var newTaskTextField: UITextField!
    @IBOutlet weak var newTaskTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task = task {
            newTaskTextField.text = task.name
        }
        
    }
}
