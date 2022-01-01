//
//  TaskListViewController.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 31/12/2021.
//

import UIKit

class TaskListViewController: UIViewController,UITableViewDataSource {
  
    var Tasks: [task] = []
    var Kidid: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        TasklistViewModel().GetTasks(Kidid: Kidid!, completed: { success, tasksfromrep in
            if success{
                self.Tasks = tasksfromrep!
                print(self.Tasks)
                self.tableView.reloadWithAnimation()
                
            
        
            }            
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
    @IBAction func addbutton(_ sender: Any) {
        performSegue(withIdentifier: "addtaskSegue", sender: Kidid)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addtaskSegue"{
        let destination = segue.destination as! AddTaskViewController
            destination.kididrecived = Kidid}
    }
    
}
extension UITableView {



    func reloadWithAnimation() {

        self.reloadData()

        let tableViewHeight = self.bounds.size.height

        let cells = self.visibleCells

        var delayCounter = 0

        for cell in cells {

            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)

        }

        for cell in cells {

            UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {

                cell.transform = CGAffineTransform.identity

            }, completion: nil)

            delayCounter += 1

        }

    }

}

