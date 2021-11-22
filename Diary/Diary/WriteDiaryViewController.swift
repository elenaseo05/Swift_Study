//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by Elena on 2021/11/09.
//

import UIKit

class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contantsTextView: UITextView!
    @IBOutlet weak var dateTextFieid: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    private let datepicker = UIDatePicker()
    private var diaryDate: Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
    }
    
    
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        // RGB 0.0 ~ 1.0 => X / 255
        //alpha 0.0 ~ 1.0
        
        self.contantsTextView.layer.borderColor = borderColor.cgColor // 색상
        // layer 관련 색상은 cgColor로 설정
        
        self.contantsTextView.layer.borderWidth = 0.5 // 테두리 두께
        self.contantsTextView.layer.cornerRadius = 5.0 // 둥굴게
    }
    
    private func configureDatePicker() { // 입력방식 datePicker로 변경
        self.datepicker.datePickerMode = .date
        self.datepicker.preferredDatePickerStyle = .wheels
        self.datepicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.datepicker.locale = Locale(identifier: "ko-KR")
        self.dateTextFieid.inputView = self.datepicker // textField의 입력뷰(inputView) datePicker로 설정
    }
    
    @IBAction func tabConfirmButton(_ sender: UIBarButtonItem) {
        
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy년 MM월 dd일(EEEEE)" // 데이트 포맷 EEEEE는 요일을 한 글자로 표시하기 위함
        formater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextFieid.text = formater.string(from: datePicker.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // 화면을 터치하면 호출 되는 메서드 
        self.view.endEditing(true)
    }
    
}
