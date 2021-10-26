//
//  ViewController.swift
//  TodoList
//
//  Created by Elena on 2021/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]() {
        didSet{
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.loadTasks()
    }
  
    @IBAction func tabEditBtn(_ sender: UIBarButtonItem) {
    }
    
    
    @IBAction func tabAddBtn(_ sender: UIBarButtonItem) {
    // Add(+) 버튼 클릭시
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
    
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title" : $0.title,
                "done" : $0.done
            ]
        }
        // UserDefaults - 사용자 기본 설정과 같은 단일 데이터에 적합 (데이터, 키)
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        let userDefault = UserDefaults.standard
        guard let data = userDefault.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    // extension : 기존에 존재하는 구조체, 클래스, 열거형에 새로운 기능 추가, 확장 가능
    // 오버라이딩 불가
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
