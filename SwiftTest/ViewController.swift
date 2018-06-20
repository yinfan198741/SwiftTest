//
//  ViewController.swift
//  SwiftTest
//
//  Created by 尹凡 on 3/4/18.
//  Copyright © 2018 尹凡. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
//    {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
    

    var name : String?
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    convenience init(name: String) {
        self.init(nibName: nil, bundle: nil)
        self.name = name
    }
    
    
    
    
    let button = Control()
    
//    override func viewDidLoad() {
//        button.setTarget(target: self, action: self.onButtonTap, controlEvent: .touchUpInside)
//    }
    
    
    
    
    func onButtonTap() {
        print("Button was tapped")
    }
    
    
     override func viewDidLoad(){
        super.viewDidLoad()

        let t = Trade.Buy(name: "Tencent", count: 1000)
        print("t = ",t)

        if case let .Buy(name: _name, count: count) = t {
            print(_name,count)
        }

        switch t {
        case .Buy(name: "Tencent", count: 1000):
            print("a")
        default:
            print("default")
        }


        let c = person.china
        print("c = ",c,"rowValue = ",c.rawValue)

        let j = person(rawValue: "jpa")
        print(j)

        let age = person.age.big
        print(age)

        let _car = car(carType:.bus)
        print(_car)

        let _carC = carC()
        print(_carC)


        let woodenHelmetProps = Wearable.Helmet(weight: .Light, armor: .Light).attributes()
        print (woodenHelmetProps)


        let de = IOSDeivces.iphone6sp
        print(de)
        print(de.rawValue)

        let classA = ClassA(num: "a")
        print(classA.numA)

        let sa = structA(sa: "b")
        print(sa.sA)

        sa.test()


        let b = UIButton(type: .custom)
        b.setTitle("测试", for: .normal)
        b.addTarget(self, action: #selector(printTest), for: .touchUpInside)
        b.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        b.backgroundColor = .red
        self.view.addSubview(b)


//        testCurry()
//        pointerTest.Test()
        
        testSelf.test()
    }
    
    @objc
    func printTest() {
//        print("button Click")
//        let p = Person()
//        greetings(person: p)
        
//        let fp = FP()
//        fp.Test()
        
//        fp.timeShort()
//        fp.nameMap()
//        fp.cuyTest()
//        var s = School()
//        s.Test()
        
//        var label1 = Label(text: "Hi", font: .systemFont(ofSize: 14))
//        print(label1.text)
//
//        var label2 = label1
//        label2.text = "1"
//        print(label2.text)
//        print(label1.text)
        
//        retain(label2.text._storage)
//        retain(label2.font)
//        // finished using label1
//        release(label1.text._storage)
//        release(label1.font)
//        // finished using label2
//        release(label2.text._storage)
//        release(label2.font)
        
    }
    
    
    struct Label {
        var text: String
        var font: UIFont
        func draw() { }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func greetings(person: Person) {
        person.sayHi()
    }
    

}


class Person: NSObject {
    func sayHi() {
        print("Hello")
    }
}

//class MisunderstoodPerson: Person {}
//extension MisunderstoodPerson {
//
//    override func sayHi() {
//        print("No one gets me.")
//    }
//}



class ReverseGenerator<T>: IteratorProtocol {
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0{
            return nil
        }
        else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}



