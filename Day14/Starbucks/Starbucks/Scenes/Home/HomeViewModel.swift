//
//  HomeViewModel.swift
//  Starbucks
//
//  Created by kid cherish on 2022/07/07.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isNeedToReload = false {
        didSet {
            guard isNeedToReload else { return }
            
            coffeeMenu.shuffle()
            events.shuffle()
            
            isNeedToReload = false
        }
    }
    
    @Published var coffeeMenu: [CoffeeMenu] = [
        CoffeeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "카페라떼"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 카페라떼"),
        CoffeeMenu(image: Image("coffee"), name: "바닐라라떼"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 바닐라라떼")
    ]
    
    @Published var events: [Event] = [
        Event(image: Image("coffee"), title: "제주도 한정 메뉴", description: "제주도 한정 음료가 출시되었습니다! 꼭 드셔보세요!"),
        Event(image: Image("coffee"), title: "여름 한정 메뉴", description: "여름이니까~ 아이스 커피~ 여~름엔~ 아이스 커피~~~ "),
        Event(image: Image("coffee"), title: "민트 한정 메뉴", description: "민트 좋아하세요? 민트 덕후라면! 강.력.추.천.")
    ]
}
