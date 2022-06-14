import RxSwift

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

//print("-----Buffer-----")
//let source = PublishSubject<String>()
//
//var count = 0
//let timer = DispatchSource.makeTimerSource()
//
//timer.schedule(deadline: .now() + 2, repeating: .seconds(1))
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

print("-----Window-----")
let observableCount = 5
let makeTime = RxTimeInterval.seconds(2)

let window = PublishSubject<String>()

var windowCount = 0
let windowTimerSource = DispatchSource.makeTimerSource()
windowTimerSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
windowTimerSource.setEventHandler {
    windowCount += 1
    window.onNext("\(windowCount)")
}
windowTimerSource.resume()

window
    .window(
        timeSpan: makeTime,
        count: observableCount,
        scheduler: MainScheduler.instance
    )
    .flatMap { windowObservable -> Observable<(index: Int, element: String)> in
        return windowObservable.enumerated()
    }
    .subscribe(onNext: {
        print("\($0.index)번째 Observable의 요소: \($0.element)")
    })
    .disposed(by: disposeBag)


//print("-----Delay-----")
//let delaySubject = PublishSubject<Int>()
//
//var delaySubjectCount = 0
//let delaySubjectTimerSource = DispatchSource.makeTimerSource()
//delaySubjectTimerSource.schedule(deadline: .now(), repeating: .seconds(1))
//delaySubjectTimerSource.setEventHandler {
//    delaySubjectCount += 1
//    delaySubject.onNext(delaySubjectCount)
//}
//delaySubjectTimerSource.resume()
//
//delaySubject
//    .delay(.seconds(3), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
