import RxSwift

let disposeBag = DisposeBag()

print("-----StartWith-----")
let yellowClass = Observable<String>.of("π©βπ¦±", "π§", "π§βπ¦±")

yellowClass
    .enumerated()
    .map { index, element in
        return element + "μ΄λ¦°μ΄" + "\(index)"
    }
    .startWith("π§μ μλ")
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----Concat1-----")
let yellowClassChildren = Observable<String>.of("π©βπ¦±", "π§", "π§βπ¦±")
let teacher = Observable<String>.of("π§μ μλ")

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
    "yellowClass": Observable.of("π©βπ¦±", "π§", "π§βπ¦±"),
    "blueClass": Observable.of("πΆπΎ", "πΆπ»")
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
let GangBuk = Observable.from(["κ°λΆκ΅¬", "μ±λΆκ΅¬", "λλλ¬Έκ΅¬"])
let GangNam = Observable.from(["κ°λ¨κ΅¬", "κ°λκ΅¬", "μλ±ν¬κ΅¬", "μμ²κ΅¬"])

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
//    .distinctUntilChanged() // Sampleκ³Ό λμΌν΄μ§
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

runner.onNext("ππ»ββοΈ")
runner.onNext("ππ»ββοΈ ππ½ββοΈ")
runner.onNext("ππ»ββοΈ ππ½ββοΈ ππΏ")
//runner.onNext("ππ»ββοΈ ππ½ββοΈ")
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

F1.onNext("π")
F1.onNext("π π")
F1.onNext("π π π")
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

bus2.onNext("λ²μ€2-μΉκ°0: π©πΎβπΌ")
bus1.onNext("λ²μ€1-μΉκ°0: π§πΌβπΌ")
bus1.onNext("λ²μ€1-μΉκ°1: π¨π»βπΌ")
bus2.onNext("λ²μ€2-μΉκ°1: π©π»βπΌ")
bus1.onNext("λ²μ€1-μΉκ°2: π§π»βπΌ")
bus2.onNext("λ²μ€2-μΉκ°2: π©πΌβπΌ")

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

