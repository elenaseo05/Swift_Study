//
//  ViewController.swift
//  TodoList
//
//  Created by Elena on 2021/10/20.
//  최초 작성 2021/10/20
//  추가 기능 구현 2021/10/28
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! // 테이블
    @IBOutlet var editButton: UIBarButtonItem! // 좌측상단 edit 버튼
    
    var doneBtn: UIBarButtonItem? // done 버튼 동적 생성
    
    var tasks = [Task]() {
        didSet{
//            didSet, willSet은 Model에서의 변경된 사항을 View에 '반영'하고자 할때 사용됨
//            didSet(oldValue)에는 이전 값이, willSet(newValue)에는 새로운 값을 받아 올 수 있다.
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtntap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }
    
    @objc func doneBtntap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }
  
    @IBAction func tabEditBtn(_ sender: UIBarButtonItem) {
        
        guard !self.tasks.isEmpty else {return}
        self.navigationItem.leftBarButtonItem = self.doneBtn
        self.tableView.setEditing(true, animated: true)
    }
    
    
    @IBAction func tabAddBtn(_ sender: UIBarButtonItem) { // add 버튼 클릭시
    // Add(+) 버튼 클릭시
        let alert = UIAlertController(title: "ADD Todo", message: nil, preferredStyle: .alert) // alert 창 띄우기
        
        // alert ADD버튼 액션
        let registerBtn = UIAlertAction(title: "ADD", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task) // tasks에 추가
            self?.tableView.reloadData()
        })
        
        // alert CANCLE 버튼 액션
        let cancleBtn = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        
        // alert 액션 추가
        alert.addAction(registerBtn)
        alert.addAction(cancleBtn)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "what is today todo LIST"
        })
        self.present(alert, animated: true, completion: nil) // 화면 전환
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


// 테이블 데이터
extension ViewController: UITableViewDataSource {
    // extension : 기존에 존재하는 구조체, 클래스, 열거형에 새로운 기능 추가, 확장 가능, 오버라이딩 불가
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done {
            cell.accessoryType = .checkmark
        }else  {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.tasks.isEmpty {
            self.doneBtntap()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
    
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
