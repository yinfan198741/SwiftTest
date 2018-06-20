//
//  FunctionVC.swift
//  SwiftTest
//
//  Created by 尹凡 on 6/19/18.
//  Copyright © 2018 尹凡. All rights reserved.
//

import Foundation
import UIKit

class FunctionVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FunctionVC")
        
        let leaf = BinarySearchTree.Leaf
        let node = BinarySearchTree.Node(BinarySearchTree.Leaf, 5, BinarySearchTree.Leaf)
        print(leaf)
        print(node)
    }
    
}
