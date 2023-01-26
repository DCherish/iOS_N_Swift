import RxSwift

let disposeBag = DisposeBag()

print("-----ignoreElement-----")
let sleepMode = PublishSubject<String>()

sleepMode
    .ignoreElements()
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

sleepMode.onNext("🔈")
sleepMode.onNext("🔈")
sleepMode.onNext("🔈")

sleepMode.onCompleted()

print("-----elementAt-----")
let twiceAlertWakeUp = PublishSubject<String>()

twiceAlertWakeUp
    .element(at: 2)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

twiceAlertWakeUp.onNext("🔈")
twiceAlertWakeUp.onNext("🔈")
twiceAlertWakeUp.onNext("😳")
twiceAlertWakeUp.onNext("🔈")

print("-----Filter-----")
Observable.of(1, 2, 3, 4, 5, 6, 7, 8)
    .filter { $0 % 2 == 0 }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----Skip-----")
Observable.of("😆", "🥹", "🙂", "😝", "🥳", "😣", "😵‍💫")
    .skip(5)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----SkipWhile-----")
Observable.of("😆", "🥹", "🙂", "😝", "🥳", "😣", "🤫", "😲")
    .skip(while: {
        $0 != "😣"
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----SkipUntil-----")
let customer = PublishSubject<String>()
let openTime = PublishSubject<String>()

customer
    .skip(until: openTime)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

customer.onNext("😒")
customer.onNext("🥸")

openTime.onNext("땡!")
customer.onNext("🤭")

print("-----Take-----")
Observable.of("🥇", "🥈", "🥉", "🥴", "😯")
    .take(3)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----TakeWhile-----")
Observable.of("🥇", "🥈", "🥉", "🥴", "😯")
    .take(while: {
        $0 != "🥉"
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----enumerated-----")
Observable.of("🥇", "🥈", "🥉", "🥴", "😯")
    .enumerated()
    .take(while: {
        $0.index < 3
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----TakeUntil-----")
let lecture = PublishSubject<String>()
let end = PublishSubject<String>()

lecture
    .take(until: end)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

lecture.onNext("🙋🏼‍♀️")
lecture.onNext("🙋🏻")

end.onNext("끝!")
lecture.onNext("🙋🏼‍♂️")

print("-----DistinctUntilChanged-----")
Observable.of("저는", "저는", "앵무새", "앵무새", "입니다", "입니다", "저는", "저는", "앵무새", "앵무새", "입니다", "입니다", "저는", "저는", "앵무새", "앵무새", "일까요?", "일까요?", "일까요?", "일까요?", "저는", "저는", "앵무새", "앵무새", "입니다", "입니다")
    .distinctUntilChanged()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
