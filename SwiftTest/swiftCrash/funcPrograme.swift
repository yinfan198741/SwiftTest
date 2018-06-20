//
//  funcPrograme.swift
//  SwiftTest
//
//  Created by 尹凡 on 5/24/18.
//  Copyright © 2018 尹凡. All rights reserved.
//

import Foundation
import UIKit

protocol Hobbyable {
    var _hobby: String? { get set }
    mutating func addHobby(_ hobby: String?)
}

extension Hobbyable {
    mutating func addHobby(_ hobby: String?) {
        _hobby = hobby
    }
}




//@_inlineable
//public func map<U>(
//    _ transform: (Wrapped) throws -> U
//    ) rethrows -> U? {
//    switch self {
//    case .some(let y):
//        return .some(try transform(y))
//    case .none:
//        return .none
//    }
//}
//
//@_inlineable
//public func flatMap<U>(
//    _ transform: (Wrapped) throws -> U?
//    ) rethrows -> U? {
//    switch self {
//    case .some(let y):
//        return try transform(y)
//    case .none:
//        return .none
//    }
//}

class FBox<T> {
    let unbox: T
    init(_ value: T) {
        self.unbox = value
    }
}

enum FResult<T> {
    case value(FBox<T>)
    case Error(NSError)
    
}

extension FResult {
    
    func map<U>(f: (T)-> U) -> FResult<U> {
        switch self {
        case .value(let box):
            let unBox:T = box.unbox
            let _u:U = f(unBox)
            
            return .value(FBox(_u))
        case .Error(let err):
            return .Error(err)
       }
    }
}


func dataWithContentFile() -> FResult<String> {
//    var error = Error
//    if let data = NSData(base64Encoded: "aaaa", options: .ignoreUnknownCharacters) {
//        return .value(FBox(data))
//    }
//    else {
//        return .Error(error!)
//    }
    
    return .value(FBox("aaaaaa"))
    
//    return .E
}
func fTest() {
    let data = dataWithContentFile()
    print(data)
    let data2 = data.map { $0.uppercased() }
    print(data2)
    switch data2 {
    case .value(let v):
        print(v.unbox)
    
    case .Error(_):
        print("error")
    }
    
    let data3 = data2.map { (sub) -> String in
       let sb = sub.suffix(3)
        return String(sb)
    }
    
    if case let FResult.value(bx) = data3 {
         print("bx.unbox")
         print(bx.unbox)
    }
    
    
    let cast:[String?] = ["Vivien", "Marlon", "Kim", "Karl",""]
    
//    let list = cast.reduce("")
//    let _cc:[String] = cast.filter { !$0?.isEmpty ?? false }
//    let list = cast.joined(separator: ", ")
    
//    print(list)
   
//    fmap_flatMap()
//    fmap_test()
}


func fmap_test()  {
    let itemDesc = ["icon": "imagePath"]
    let iconName = itemDesc["icon"]
    
    let imageV = UIImageView(frame: CGRect.zero)
//    imageV.image = iconName.map{ path in UIImage(named: path)}
    imageV.image = iconName.flatMap { imageName in UIImage(named: imageName) }
    
}


func fmap_flatMap() {
    
    
    
    var a:Int? = 0
    var b = a.map{return $0 + 1}.map{return $0 + 1}.map{return $0 + 1}.map{return $0 + 1}
    print(b)
    
    let formatter = NumberFormatter()
//    formatter.numberStyle = .SpellOutStyle
    let str = "This is Functional Programming"
    
    

    
//    let translateURLs = string
//        // Split the characters into words
//        .characters.split(separator: " ")
//        // Count the number of characters on each word
//        .map { $0.count }
//        // Spell out this number of chars (`stringFromNumber` can return nil)
//        .flatMap { formatter.string(from: NSNumber(value:$0)) }
//        // add " letters" suffix
//        .map { "\($0) letters" }
//        // encode the string so it can be used in an NSURL framgment after the # (the stringByAdding… method can return nil)
//        //.flatMap { $0.stringByAddingPercentEncodingWithAllowedCharacters(.URLFragmentAllowedCharacterSet()) }
//        // Build an NSURL using that string (`NSURL(string: …)` is failable: it can return nil)
//        .flatMap { NSURL(string: "https://translate.google.com/#auto/fr/\($0)") }
//
//    print(translateURLs)
    
    
//    str.characters.sp
    
}




//: This is a companion Playground for the article "Swift Functors, Applicatives, and Monads in Pictures", available at http://www.mokacoding.com/blog/functor-applicative-monads-in-pictures/
//: The article itself is a translation of the original "Functors, Applicatives, and Monads in Pictures" written for Haskell by Aditya Bhargava, available at http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html
//:
//: ## Optional
//:
//: Optional is just a type

enum MyOptional<T> {
    case Some(T)
    case None
}

//: ## Functor
//:
//: Optional defines map, which knows how to apply a function to the optional value, depending on it's state

func plusThree(addend: Int) -> Int {
    return addend + 3
}



let a = Optional.some(2).map(plusThree)

//: We can use autoclosures and be more succint

let b = Optional.some(2).map { $0 + 3 }

//: If the optional value is .None, map will return .None (nil)

let c = Optional.none.map { $0 + 3 }

//: Map implementation might look like this

func myMap<T, U>(a: T?, f: (T) -> U) -> U? {
    switch a {
    case .some(let x): return f(x)
    case .none: return .none
    }
}

let d = myMap(a: Optional.some(2), f: { $0 + 3 })

//: We can define an infix operator


precedencegroup ATPrecedence {
    associativity: left
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
}

infix operator <^> : ATPrecedence

func <^><T, U>(f: (T) -> U, a: T?) -> U? {
    return a.map(f)
}

let f = plusThree <^> Optional.some(2)

//: Turns out functions can be mapped as well. Functions are functors too!

typealias IntFunction = (Int) -> Int

func map(f: @escaping IntFunction, _ g:@escaping IntFunction) -> IntFunction {
    return { x in f(g(x)) }
}

let foo = map(f: { $0 + 2 }, { $0 + 3 })
let h = foo(10)

//: ## Applicative
extension Optional {
    func apply<U>(f: ((Wrapped) -> U)?) -> U? {
        switch f {
        case .some(let someF): return self.map(someF)
        case .none: return .none
        }
    }
}

extension Array {
    func apply<U>(fs: [(Element) -> U]) -> [U] {
        var result = [U]()
        for f in fs {
            for element in self.map(f) {
                result.append(element)
            }
        }
        return result
    }
}

infix operator <*> : ATPrecedence

func <*><T, U>(f: ((T)-> U)?, a: T?) -> U? {
    return a.apply(f: f)
}

func <*><T, U>(f: [(T) -> U], a: [T]) -> [U] {
    return a.apply(fs: f)
}

let s = Optional.some({ $0 + 3 }) <*> Optional.some(2)

let arrayApplicative = [ { $0 + 3 }, { $0 * 2 } ] <*> [1, 2, 3]
//: _Playground (as of Xcode 7 Beta 3) doesn't seem to be happy show the result of array applications , so we'll print open the console with Cmd + Y to see it_

let g = print(arrayApplicative)

func curriedAddition(a: Int, b: Int) -> Int {
    return a + b
}

//let ca = curriedAddition <^> Optional(2) <*> Optional(3)

func curriedTimes(a: Int, b: Int) -> Int {
    return a * b
}

//curriedTimes <^> Optional(5) <*> Optional(3)

//: ## Monads

infix operator >>- : ATPrecedence

func >>-<T, U>(a: T?, f: (T) -> U?) -> U? {
    return a.flatMap(f)
}

func half(a: Int) -> Int? {
    return a % 2 == 0 ? a / 2 : .none
}

let r3 = Optional(3) >>- half
let r4 = Optional(4) >>- half
let rn = Optional.none >>- half

//: We can even chain >>-

let r = Optional(20) >>- half >>- half >>- half




