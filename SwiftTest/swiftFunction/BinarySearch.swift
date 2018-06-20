//
//  BinarySearch.swift
//  SwiftTest
//
//  Created by 尹凡 on 6/19/18.
//  Copyright © 2018 尹凡. All rights reserved.
//

import Foundation

indirect enum BinarySearchTree {
    case Leaf
    case Node(BinarySearchTree,Int,BinarySearchTree)
}


extension BinarySearchTree {
    init() {
        self = .Leaf
    }
    
    init(_ value: Int) {
        self = .Node(.Leaf, value, .Leaf)
    }
}



