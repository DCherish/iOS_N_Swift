//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by kid cherish on 2022/05/26.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SeguePresentViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SeguePresentViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SeguePresentViewController viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SeguePresentViewController viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SeguePresentViewController viewDidDisappear")
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        // 두 개의 동작은 사용자의 관점에서 전혀 차이를 느낄 수 없음
        // 다만 completion 함수 구현에 있어 dismiss를 한 이후에 결과를 어디에게 알려주느냐에 차이가 있음
        self.presentingViewController?.dismiss(animated: true, completion: nil)
//        self.dismiss(animated: true) {
//            print("presentViewController completion execute")
//        }
    }
}
