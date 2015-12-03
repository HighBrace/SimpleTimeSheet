//: Playground - noun: a place where people can play

import UIKit
import ReactiveCocoa
import XCPlayground
import Nimble

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

expect(true).to(equal(true))


var str = "Hello, playground"

var obss = Observer<String, NoError>()

var producer = SignalProducer<String, NoError> { observer, disposable in
    obss = observer
    observer.sendNext("Jonas Sääv")
    observer.sendNext("Kalle")
}

var _mutableStringProp = MutableProperty<String?>("Inget")

var mutableStringProp = AnyProperty(_mutableStringProp)

var prop = AnyProperty<String>(initialValue: "Nothing", producer: producer)

obss.sendNext("Marie Tilja")

prop.producer.on(next: { print($0) }).start()


let a = mutableStringProp.producer.on(next: { print($0!) } ).start()

_mutableStringProp.value = "Hej"

a.dispose()

_mutableStringProp.value = "Jonas"

var (sig, obs) = Signal<String?, NoError>.pipe()

var prop2 = AnyProperty<String?>(initialValue: nil, signal: sig)

obs.sendNext("A")
obs.sendNext("B")
obs.sendNext("C")


prop2.value

prop2.producer.map { s in s! + s!}.on(next: { print($0) } ).start()

obs.sendNext("D")
obs.sendNext("E")

let (s, o) = SignalProducer<String, NoError>.buffer(4)

var prop3 = AnyProperty<String>(initialValue: "Nothing", producer: s)

s.on(next: { print($0) }).start()

prop3.producer.on(next: { print("prop3 sideeffect " + $0) }).start()


o.sendNext("Hej")
o.sendNext("Jag")
o.sendNext("Heter")
o.sendNext("Jonas")

let age = 42

print("Jonas är \(age)" )

let intNio: Int = 9
let stringNio = "\(intNio)"





