import RxSwift

let disposeBag = DisposeBag()

print("-----StartWith-----")
let yellowClass = Observable<String>.of("👩‍🦱", "👧", "🧑‍🦱")

yellowClass
    .enumerated()
    .map { index, element in
        return element + "어린이" + "\(index)"
    }
    .startWith("🧓선생님")
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----Concat1-----")
let yellowClassChildren = Observable<String>.of("👩‍🦱", "👧", "🧑‍🦱")
let teacher = Observable<String>.of("🧓선생님")

let lineWalk = Observable
    .concat([teacher, yellowClassChildren])

lineWalk
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----Concat2-----")
teacher
    .concat(yellowClassChildren)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----ConcatMap-----")
let school: [String: Observable<String>] = [
    "yellowClass": Observable.of("👩‍🦱", "👧", "🧑‍🦱"),
    "blueClass": Observable.of("👶🏾", "👶🏻")
]

Observable.of("yellowClass", "blueClass")
    .concatMap { whichClass in
        school[whichClass] ?? .empty()
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----Merge1-----")
let GangBuk = Observable.from(["강북구", "성북구", "동대문구"])
let GangNam = Observable.from(["강남구", "강동구", "영등포구", "양천구"])

Observable.of(GangBuk, GangNam)
    .merge()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----Merge2-----")
Observable.of(GangBuk, GangNam)
    .merge(maxConcurrent: 1)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----CombineLatest1-----")
let fname = PublishSubject<String>()
let lname = PublishSubject<String>()

let name = Observable
    .combineLatest(fname, lname) { fname, lname in
        fname + lname
    }

name
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

fname.onNext("kim")
lname.onNext("chulsu")
lname.onNext("youngsu")
lname.onNext("eunyoung")
fname.onNext("park")
fname.onNext("lee")
fname.onNext("jo")

print("-----CombineLatest2-----")
let dateFormat = Observable<DateFormatter.Style>.of(.short, .long)
let currentDate = Observable<Date>.of(Date())

let currentDateFormat = Observable
    .combineLatest(
        dateFormat,
        currentDate,
        resultSelector: { format, date -> String in
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = format
            return dateFormatter.string(from: date)
        }
    )

currentDateFormat
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----CombineLatest3-----")
let lastName = PublishSubject<String>()
let firstName = PublishSubject<String>()

let fullName = Observable
    .combineLatest([firstName, lastName]) { name in
        name.joined(separator: " ")
    }

fullName
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

lastName.onNext("Kim")
firstName.onNext("Paul")
firstName.onNext("Stella")
firstName.onNext("Lily")

print("-----Zip-----")
enum winlose {
    case win
    case lose
}

let match = Observable<winlose>.of(.win, .win, .lose, .win, .lose)
let athlete = Observable<String>.of("Korea", "Swiss", "USA", "Brazil", "Japan", "China")

let result = Observable
    .zip(match, athlete) { result, represent in
        return represent + " athlete" + " \(result)"
    }

result
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----WithLatestFrom1-----")
let bang = PublishSubject<Void>()
let runner = PublishSubject<String>()

bang
    .withLatestFrom(runner)
//    .distinctUntilChanged() // Sample과 동일해짐
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

runner.onNext("🏃🏻‍♀️")
runner.onNext("🏃🏻‍♀️ 🏃🏽‍♂️")
runner.onNext("🏃🏻‍♀️ 🏃🏽‍♂️ 🏃🏿")
//runner.onNext("🏃🏻‍♀️ 🏃🏽‍♂️")
bang.onNext(Void())
bang.onNext(Void())

print("-----Sample-----")
let go = PublishSubject<Void>()
let F1 = PublishSubject<String>()

F1.sample(go)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

F1.onNext("🏎")
F1.onNext("🏎 🚗")
F1.onNext("🏎 🚗 🚙")
go.onNext(Void())
go.onNext(Void())
go.onNext(Void())

print("-----Amb-----") // ambiguous
let bus1 = PublishSubject<String>()
let bus2 = PublishSubject<String>()

let busstop = bus1.amb(bus2)

busstop
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

bus2.onNext("버스2-승객0: 👩🏾‍💼")
bus1.onNext("버스1-승객0: 🧑🏼‍💼")
bus1.onNext("버스1-승객1: 👨🏻‍💼")
bus2.onNext("버스2-승객1: 👩🏻‍💼")
bus1.onNext("버스1-승객2: 🧑🏻‍💼")
bus2.onNext("버스2-승객2: 👩🏼‍💼")

print("-----SwitchLatest-----")
let student1 = PublishSubject<String>()
let student2 = PublishSubject<String>()
let student3 = PublishSubject<String>()

let handsUp = PublishSubject<Observable<String>>()

let classroom = handsUp.switchLatest()

classroom
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

handsUp.onNext(student1)
student1.onNext("Student1: Hello! I'm Student 1")
student1.onNext("Student1: Hello! I'm Student 11111")
student2.onNext("Student2: Hello! I'm Student 2")
student1.onNext("Student1: Hello! I'm Student 1111111111")

handsUp.onNext(student2)
student2.onNext("Student2: Hello! I'm Student 2")
student1.onNext("Student1: Hello! I'm Student 1")

handsUp.onNext(student3)
student2.onNext("Student2: Hello! I'm Student 2")
student1.onNext("Student1: Hello! I'm Student 1")
student3.onNext("Student3: Hello! I'm Student 3")

handsUp.onNext(student1)
student1.onNext("Student1: Hello! I'm Student 1")
student2.onNext("Student2: Hello! I'm Student 2")
student3.onNext("Student3: Hello! I'm Student 3")
student2.onNext("Student2: Hello! I'm Student 2")

print("-----Reduce-----")
Observable.from((1...10))
//    .reduce(0, accumulator: { summary, newValue in
//        return summary + newValue
//    })
//    .reduce(0) { summary, newValue in
//        return summary + newValue
//    }
    .reduce(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----Scan-----")
Observable.from((1...10))
//    .scan(0, accumulator: { summary, newValue in
//        return summary + newValue
//    })
//    .scan(0) { summary, newValue in
//        return summary + newValue
//    }
    .scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

