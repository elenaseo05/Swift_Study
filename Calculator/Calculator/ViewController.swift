//
//  ViewController.swift
//  Calculator
//
//  Created by Elena on 2021/09/27.
//

import UIKit

enum Operation {
    case Add
    case Sub
    case Div
    case Mul
    case unknown
}


class ViewController: UIViewController {
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNum = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tabNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNum.count < 9 { // 화면에 숫자가 9개 이상 표기 되지 않도록 한다.
            self.displayNum += numberValue
            self.numberOutputLabel.text = self.displayNum
        }
    }
    
    @IBAction func tabClearButton(_ sender: UIButton) {
    }
    
    @IBAction func tabDotButton(_ sender: UIButton) {
    }
    
    @IBAction func tabDivideButton(_ sender: UIButton) {
    }
    
    @IBAction func tabMultiplyButton(_ sender: UIButton) {
    }
    
    @IBAction func tabSubtractButton(_ sender: UIButton) {
    }
    
    @IBAction func tabAddButton(_ sender: UIButton) {
    }
    
    @IBAction func tabEqualButton(_ sender: UIButton) {
    }
    
}

