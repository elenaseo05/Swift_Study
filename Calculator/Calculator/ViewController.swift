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
        displayNum = ""
        firstOperand = ""
        secondOperand = ""
        result = ""
        currentOperation = .unknown
        numberOutputLabel.text = "0"
    }
    
    @IBAction func tabDotButton(_ sender: UIButton) {
        if self.displayNum.count < 8, !self.displayNum.contains(".") {
//                         길이확인 함수                  포함여부를 확인함수
            
            self.displayNum += self.displayNum.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNum
        }
    }
    
    @IBAction func tabDivideButton(_ sender: UIButton) {
        self.operation(.Div) // 나누기
    }
    
    @IBAction func tabMultiplyButton(_ sender: UIButton) {
        self.operation(.Mul) // 곱하기
    }
    
    @IBAction func tabSubtractButton(_ sender: UIButton) {
        self.operation(.Sub)
    }
    
    @IBAction func tabAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tabEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation : Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNum.isEmpty {
                self.secondOperand = self.displayNum
                self.displayNum = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                    case .Add: // 더하기
                        self.result = "\(firstOperand + secondOperand)"
                    case .Sub: // 빼기
                        self.result = "\(firstOperand - secondOperand)"
                    case .Div: // 나누기
                        self.result = "\(firstOperand / secondOperand)"
                    case .Mul: // 곱하기
                        self.result = "\(firstOperand * secondOperand)"
                    default:
                        break
                }
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
                
            }
            
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNum
            self.currentOperation = operation
            self.displayNum = ""
        }
    }
    
}

