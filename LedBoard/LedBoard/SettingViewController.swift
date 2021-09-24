//
//  SettingViewController.swift
//  LedBoard
//
//  Created by Elena on 2021/09/23.
//

import UIKit

class SettingViewController: UIViewController {
    // text
    @IBOutlet weak var textField: UITextField!
    // text btn
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    // background
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var buleBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tabTextColorBtn(_ sender: UIButton) {
        
        
    }
    

    @IBAction func tabBackgroundColorBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func tabSaveBtn(_ sender: UIButton) {
        
    }
    
    private func changeTextColor(color: UIColor ) {
        self.yellowBtn.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleBtn.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenBtn.alpha = color == UIColor.green ? 1 : 0.2
    }
    
}
