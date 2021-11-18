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
    
    private func configureDatePicker() {
        self.datepicker.datePickerMode = .date
        self.datepicker.preferredDatePickerStyle = .wheels
    }
    
    

}
