import RxSwift

let disposeBag = DisposeBag()

print("-----PublishSubject-----")
let publishSubject = PublishSubject<String>()

publishSubject.onNext("#1 여러분 안녕하세요?")

let sub1 = publishSubject
    .subscribe(onNext: {
        print("첫 번째 구독: \($0)")
    })

publishSubject.onNext("#2 들리세요?")
publishSubject.on(.next("#3 안들리시나요?"))

sub1.dispose()

let sub2 = publishSubject
    .subscribe(onNext: {
        print("두 번째 구독: \($0)")
    })

publishSubject.onNext("#4 여보세요~")
publishSubject.onCompleted()

publishSubject.onNext("#5 똑똑~~~")

sub2.dispose()

publishSubject
    .subscribe {
        print("세 번째 구독:", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

publishSubject.onNext("#6 끝났을까요?")

print("-----BehaviorSubject-----")
enum SubjectError: Error {
    case error1
}

let behaviorSubject = BehaviorSubject<String>(value: "#0 초기값")

behaviorSubject.onNext("#1 첫 번째 값")

behaviorSubject.subscribe {
    print("첫 번째 구독:", $0.element ?? $0)
}
.disposed(by: disposeBag)

//behaviorSubject.onError(SubjectError.error1)

behaviorSubject.subscribe {
    print("두 번째 구독:", $0.element ?? $0)
}
.disposed(by: disposeBag)

let value = try? behaviorSubject.value()
print(value)

print("-----ReplaySubject-----")
let replaySubject = ReplaySubject<String>.create(bufferSize: 2)

replaySubject.onNext("#1 여러분")
replaySubject.onNext("#2 힘내세요")
replaySubject.onNext("#3 어렵지만")

replaySubject.subscribe {
    print("첫 번째 구독:", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.subscribe {
    print("두 번째 구독:", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.onNext("#4 힘내봅시다")
replaySubject.onNext("#5 화이팅")
replaySubject.onError(SubjectError.error1)
replaySubject.onNext("#6 아자아자")
replaySubject.dispose()

replaySubject.subscribe {
    print("세 번째 구독:", $0.element ?? $0)
}
.disposed(by: disposeBag)
