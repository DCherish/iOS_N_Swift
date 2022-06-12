import Foundation
import RxSwift

print("-----Just-----")
Observable<Int>.just(1)
    .subscribe(onNext: {
        print($0)
    })

print("-----Of1-----")
Observable<Int>.of(1, 2, 3, 4, 5)
    .subscribe(onNext: {
        print($0)
    })

print("-----Of2-----")
Observable.of([1, 2, 3, 4, 5])
    .subscribe(onNext: {
        print($0)
    })

print("-----From-----")
Observable.from([1, 2, 3, 4, 5])
    .subscribe(onNext: {
        print($0)
    })

print("-----SubScribe1-----")
Observable.of(1, 2, 3)
    .subscribe({
        print($0)
    })

print("-----SubScribe2-----")
Observable.of(1, 2, 3)
    .subscribe({
        if let element = $0.element {
            print(element)
        }
    })

print("-----SubScribe3-----")
Observable.of(1, 2, 3)
    .subscribe(onNext: {
        print($0)
    })

print("-----Empty-----")
Observable<Void>.empty()
    .subscribe {
        print($0)
    }

print("-----never-----")
Observable<Void>.never()
    .debug("never")
    .subscribe(
        onNext: {
            print($0)
        },
        onCompleted: {
            print("Completed")
        })

print("-----Range-----")
Observable.range(start: 1, count: 9)
    .subscribe(onNext: {
        print("2 * \($0) = \(2*$0)")
    })

print("-----Dispose-----")
Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }
    .dispose()

print("-----DisposeBag-----")
let disposeBag = DisposeBag()

Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)


print("-----Create1-----")
Observable.create { observer -> Disposable in
    observer.onNext(1)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}
.subscribe {
    print($0)
}

print("-----Create2-----")
enum MyError: Error {
    case anError
}
Observable.create { observer -> Disposable in
    observer.onNext(1)
    observer.onError(MyError.anError)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}
.subscribe(
    onNext: {
        print($0)
    },
    onError: {
        print($0.localizedDescription)
    },
    onCompleted: {
        print("Completed")
    },
    onDisposed: {
        print("disposed")
    }
)
.disposed(by: disposeBag)

print("-----Deferred1-----")
Observable.deferred {
    Observable.of(1, 2, 3)
}
.subscribe {
    print($0)
}
.disposed(by: disposeBag)

print("-----Deferred2-----")
var flag: Bool = false

let factory: Observable<String> = Observable.deferred {
    flag = !flag
    
    if flag {
        return Observable.of("☝️")
    } else {
        return Observable.of("👇")
    }
}

for _ in 0...3 {
    factory.subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
}
