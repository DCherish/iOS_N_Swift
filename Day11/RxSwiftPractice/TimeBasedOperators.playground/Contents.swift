import RxSwift
import RxCocoa
import UIKit
import PlaygroundSupport

let disposeBag = DisposeBag()

print("-----Replay-----")
let Hello = PublishSubject<String>()
let parrot = Hello.replay(1)
parrot.connect()

Hello.onNext("#1 Hello")
Hello.onNext("#2 Hi")

parrot
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

Hello.onNext("#3 안녕하세요")

print("-----ReplayAll-----")
let dr_Strange = PublishSubject<String>()
let timeStone = dr_Strange.replayAll()
timeStone.connect()

dr_Strange.onNext("도르마무")
dr_Strange.onNext("거래를 하러왔다")

timeStone
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

dr_Strange.onNext("도르마무")
dr_Strange.onNext("거래를 하러왔다")

//print("-----Buffer-----")
//let source = PublishSubject<String>()
//
//var count = 0
//let timer = DispatchSource.makeTimerSource()
//
//timer.schedule(deadline: .now() + 3, repeating: .seconds(1))
//timer.setEventHandler {
//    count += 1
//    source.onNext("\(count)")
//}
//timer.resume()
//
//source
//    .buffer(
//        timeSpan: .seconds(2),
//        count: 2,
//        scheduler: MainScheduler.instance
//    )
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

//print("-----Window-----")
////let observableMaxCount = 1
//let observableMaxCount = 5
//let spanTime = RxTimeInterval.seconds(2)
//
//let window = PublishSubject<String>()
//
//var windowCount = 0
//let windowTimerSource = DispatchSource.makeTimerSource()
//windowTimerSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//windowTimerSource.setEventHandler {
//    windowCount += 1
//    window.onNext("\(windowCount)")
//}
//windowTimerSource.resume()
//
//window
//    .window(
//        timeSpan: spanTime,
//        count: observableMaxCount,
//        scheduler: MainScheduler.instance
//    )
//    .flatMap { windowObservable -> Observable<(index: Int, element: String)> in
//        return windowObservable.enumerated()
//    }
//    .subscribe(onNext: {
//        print("\($0.index)번째 Observable의 요소: \($0.element)")
//    })
//    .disposed(by: disposeBag)

//print("-----DelaySubscription-----")
//let delaySource = PublishSubject<String>()
//
//var delayCount = 0
//let delayTimeSource = DispatchSource.makeTimerSource()
//delayTimeSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//delayTimeSource.setEventHandler {
//    delayCount += 1
//    delaySource.onNext("\(delayCount)")
//}
//delayTimeSource.resume()
//
//delaySource
//    .delaySubscription(.seconds(5), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

//print("-----Delay-----")
//let delaySubject = PublishSubject<Int>()
//
//var delayCount = 0
//let delayTimerSource = DispatchSource.makeTimerSource()
//delayTimerSource.schedule(deadline: .now(), repeating: .seconds(1))
//delayTimerSource.setEventHandler {
//    delayCount += 1
//    delaySubject.onNext(delayCount)
//}
//delayTimerSource.resume()
//
//delaySubject
//    .delay(.seconds(3), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

//print("-----Interval-----")
//Observable<Int>
//    .interval(.seconds(3), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

//print("-----Timer-----")
//Observable<Int>
//    .timer(
//        .seconds(5),
//        period: .seconds(2),
//        scheduler:  MainScheduler.instance
//    ).subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
                
print("-----TimeOut-----")
let doNotTappedError = UIButton(type: .system)
doNotTappedError.setTitle("눌러주세요!", for: .normal)
doNotTappedError.sizeToFit()

PlaygroundPage.current.liveView = doNotTappedError

doNotTappedError.rx.tap
    .do(onNext: {
        print("tap")
    })
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)
