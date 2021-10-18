//
//  RoundButton.swift
//  Calculator
//
//  Created by Elena on 2021/10/11.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

//    @IBInspectable var isRound: Bool = false {
//        didSet{
//            if isRound {
//                self.layer.cornerRadius = self.frame.height / 2
//            }
//        }
//    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }


}
