import RxSwift

let disposeBag = DisposeBag()

print("-----toArray-----")
Observable.of("A", "B", "C")
    .toArray()
    .subscribe(
        onSuccess: {
            print($0)
        }
    )
    .disposed(by: disposeBag)

print("-----Map-----")
Observable.of(Date())
    .map { date -> String in
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----FlatMap-----")
protocol athlete {
    var score: BehaviorSubject<Int> { get }
}

struct archer: athlete {
    var score: BehaviorSubject<Int>
}

let koreaNA = archer(score: BehaviorSubject<Int>(value: 10))
let usaNA = archer(score: BehaviorSubject<Int>(value: 8))

let olympic = PublishSubject<athlete>() // 중첩된 Observable

olympic
    .flatMap { athlete in
        athlete.score
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

olympic.onNext(koreaNA)
koreaNA.score.onNext(10)

olympic.onNext(usaNA)
koreaNA.score.onNext(10)
usaNA.score.onNext(9)

print("-----FlatMapLatest-----")
struct highjumper: athlete {
    var score: BehaviorSubject<Int>
}

let seoulA = highjumper(score: BehaviorSubject<Int>(value: 7))
let jejuA = highjumper(score: BehaviorSubject<Int>(value: 6))

let champs = PublishSubject<athlete>()

champs
    .flatMapLatest { athlete in
        athlete.score
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

champs.onNext(seoulA) // 서울 점수 시퀀스 집중 (최신)
seoulA.score.onNext(9)

champs.onNext(jejuA) // 이제 제주 점수 시퀀스 변경 집중 (최신)
seoulA.score.onNext(10) // 제주로 변경되었고 서울은 해제되었기에 변경되어도 출력이 X, 변경은 O
jejuA.score.onNext(8)
jejuA.score.onNext(6)

champs.onNext(seoulA) // 다시 서울 점수 시퀀스 변경 집중 (최신)
jejuA.score.onNext(7) // 서울로 변경되었고 제주는 해제되었기에 변경되어도 출력 X, 변경은 O
seoulA.score.onNext(9)
jejuA.score.onNext(8) // 역시 마찬가지

print("-----Materialize and Dematerialize-----")
enum foul: Error {
    case earlyStart
}

struct runner: athlete {
    var score: BehaviorSubject<Int>
}

let kim = runner(score: BehaviorSubject<Int>(value: 0))
let park = runner(score: BehaviorSubject<Int>(value: 1))

let meter100 = BehaviorSubject<athlete>(value: kim)

meter100
    .flatMapLatest { athlete in
        athlete.score
            .materialize()
    }
    .filter {
        guard let error = $0.error else {
            return true
        }
        print(error)
        return false
    }
    .dematerialize()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

kim.score.onNext(1)
kim.score.onError(foul.earlyStart)
kim.score.onNext(2)

meter100.onNext(park)

print("-----Example(phoneNumber11)-----")
let input = PublishSubject<Int?>()

input
    .flatMap {
        $0 == nil ? Observable.empty() : Observable.just($0)
    }
    .map { $0! }
    .filter { $0 < 10 }
    .skip(while: { $0 != 0 })
    .take(11)
    .toArray()
    .asObservable()
    .map {
        $0.map { "\($0)" }
    }
    .map { numbers in
        var numberList = numbers
        numberList.insert("-", at: 3)
        numberList.insert("-", at: 8)

        let number = numberList.reduce("", +)
        return number
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

input.onNext(10)
input.onNext(3)
input.onNext(0)
input.onNext(nil)
input.onNext(1)
input.onNext(0)
input.onNext(7777)
input.onNext(4)
input.onNext(3)
input.onNext(nil)
input.onNext(1)
input.onNext(8)
input.onNext(7777)
input.onNext(9)
input.onNext(4)
input.onNext(9)
input.onNext(1)
input.onNext(7)
input.onNext(777)
input.onNext(7777)
input.onNext(0)
