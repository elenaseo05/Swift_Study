//
//  ViewController.swift
//  Phrase
//
//  Created by Elena on 2021/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let quote = [ // 명언 data
        Quote(contents: "할 수 없다 라고 생각하는 동안은 하기 싫다 라고 다짐하는 것이다. 그러므로 그것은 실행되지 않는다.", name: "스피노자"),
        Quote(contents: "서두르지 말되 멈추지 말라", name: "괴테"),
        Quote(contents: "과거에서 교훈을 얻을 수는 있어도 과거 속에서 살 수는 없다.", name: "린든 B. 존슨"),
        Quote(contents: "길을 아는 것과 그 길을 걷는 것은 분명히 다르다.", name: "모피어스"),
        Quote(contents: "당신은 춤츠리기보다 활짝 피어나도록 만들어진 존재입니다.", name: "오프라 윈프리")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func generaterQuote(_ sender: Any) {
        
        // 난수 발생 시키기
        // arc4random() -> Uint32 [UInt = 양수] 0과 2^32-1 사이의 난수
        // arc4random_uniform(Uint32) -> Uint32 0 ~ 파라미터에 전달 된 값 -1 사이의 난수
        // drand48() -> Double 0 ~ 0.1 사이의 난수
        
        let random = Int(arc4random_uniform(5)) // 0 ~ 4의 난수 발생
        let quote = quote[random] // random quote 가져오기
        
        self.quoteLabel.text = quote.contents // 명언 초기화
        self.nameLabel.text = quote.name // 이름 초기화
        
    }
}

