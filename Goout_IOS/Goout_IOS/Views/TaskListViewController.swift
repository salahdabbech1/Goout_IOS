//
//  TaskListViewController.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 31/12/2021.
//

import UIKit

class TaskListViewController: UIViewController,UITableViewDataSource {
    var Kidid: String?
    var Tasks: [task] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidAppear(_ animated: Bool) {
        TasklistViewModel().GetTasks(Kidid: Kidid!, completed: { success, tasksfromrep in
            if success{
                self.Tasks = tasksfromrep!
                print(self.Tasks)
                self.tableView.reloadData()
                
            
        
            }
            else{print("alert")}
        })
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Taskcell")
        let cv = cell?.contentView
        let nameLabel = cv?.viewWithTag(1) as! UILabel
        nameLabel.text = Tasks[indexPath.row].Name
        return cell!
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
