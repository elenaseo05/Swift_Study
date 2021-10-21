//
//  ViewController.swift
//  TodoList
//
//  Created by Elena on 2021/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabEditBtn(_ sender: UIBarButtonItem) { // Edit 버튼 클릭시
    }
    
    @IBAction func tabAddBtn(_ sender: UIBarButtonItem) { // Add(+) 버튼 클릭시
        let alert = UIAlertController(title: "ADD Todo", message: nil, preferredStyle: .alert) // alert 창 띄우기
        
        let registerBtn = UIAlertAction(title: "ADD", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        })
        
        let cancleBtn = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        
        alert.addAction(registerBtn)
        alert.addAction(cancleBtn)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "what are you going to do today"
        })
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
}
