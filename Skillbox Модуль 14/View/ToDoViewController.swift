//
//  ToDoViewController.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let realm = RealmPersistance.shared.realm
    var checked = false
    var selectTask: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func tapNewItem(_ sender: Any) {
        showTaskView(task: nil)
    }
    
    func showTaskView(task: Task?){
        selectTask = task
        performSegue(withIdentifier: "ScreenWithNewTask", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? NewTaskViewController, segue.identifier == "ScreenWithNewTask" {
            vc.delegate = self
            vc.task = selectTask
        }
        
    }
    
}

extension ToDoViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RealmPersistance.shared.toDoTasks.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ToDoTableViewCell
        let task = RealmPersistance.shared.toDoTasks[indexPath.row]
        
        cell.delegate = self
        cell.configure(task: task)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let objectToDelete = RealmPersistance.shared.toDoTasks[indexPath.row]
            try! RealmPersistance.shared.realm.write{
                RealmPersistance.shared.realm.delete(objectToDelete)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}

extension ToDoViewController: ToDoTableViewCellDelegate {
    
    func tapSwitch(task: Task, isOn: Bool) {
        let someVar = realm.objects(Task.self).filter("id = %@", task.id)
        let realm = RealmPersistance.shared.realm
        if let someVar1 = someVar.first {
            try! realm.write {
                someVar1.isFinish = isOn
            }
        }
    }
    
    func tap(task: Task) {
        showTaskView(task: task)
    }
}

extension ToDoViewController: NewTaskViewControllerDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}
