//
//  ToDoTableViewCell.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import UIKit

protocol ToDoTableViewCellDelegate {
    func tap(task: Task)
    func tapSwitch(task: Task, isOn: Bool)
}

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var isFinishedSwitch: UISwitch!

    
    var delegate: ToDoTableViewCellDelegate?
    
    var task: Task?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let gesture = UITapGestureRecognizer(target: self, action: #selector(someAction(_:)))
        self.addGestureRecognizer(gesture)
    }
    
    func configure(task: Task) {
        self.task = task
        taskNameLabel.text = task.name
        isFinishedSwitch.isOn = task.isFinish
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @objc func someAction(_ sender: UITapGestureRecognizer){
        if let task = task {
          delegate?.tap(task: task)
        }
    }
    
    @IBAction func tapSwich(_ sender: Any) {
        if let task = task {
          delegate?.tapSwitch(task: task, isOn: isFinishedSwitch.isOn)
    }
}

}
