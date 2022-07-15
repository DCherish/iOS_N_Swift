//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by kid cherish on 2022/05/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    var state: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapChangeColorButton(_ sender: UIButton) {
        if !state {
            self.colorView.backgroundColor = UIColor.systemGreen
        } else {
            self.colorView.backgroundColor = UIColor.systemIndigo
        }
        
        state.toggle()
        
        print("색상 변경 버튼이 클릭되었습니다.")
    }
}

