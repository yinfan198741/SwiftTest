//
//  StringCrash.swift
//  SwiftTest
//
//  Created by 尹凡 on 5/23/18.
//  Copyright © 2018 尹凡. All rights reserved.
//

import Foundation

struct StringCrash {
    
    static func aaa(a:Int) -> Int? {
        return a+1
    }
    
    static func Test() {
        var str = "Hello, playground"
        print(str)
        print(str.count)
        print(str.endIndex)
        let strIndx = str.index(str.startIndex, offsetBy: 1)
        print(strIndx)
        print(str.sfPrefix(-1))
        
        
        var a: Int? = 5
        print(a)
        
       let b =  a.map { (a) -> Int in
            return a+1
        }
        print(b)
        
        let aaab = aaa(a: 100)
        print(aaab)
        
    }
}


extension String {
    public func sfPrefix(_ maxLength: Int) -> Substring {
        return self.prefix(maxLength > 0 ? maxLength : 0)
    }
    
    
}




//print(str.count)


//print(str.removeSubrange(NSMakeRange(0, 4)))


//var a = -1
//print(str.sfPrefix(a))

