//: Playground - noun: a place where people can play

/*
 Created by nihar chadhei
 
 Print Ancestor of binary tree
           1
         /   \
        2      3
      /  \
     4     5
   /  \
  7    6
 */

import UIKit

class Node {
    var data: Int?
    var left: Node?
    var right: Node?
    init(val: Int?) {
        data = val
        left = nil
        right = nil
    }
}

class BinaryTree {
    var root: Node?
    
    func printTreeAncestors(node: Node?, target: Int) -> Bool {
        if node == nil {
            return false
        }
        if target == node?.data {
            return true
        }
        if printTreeAncestors(node: node?.left, target: target) || printTreeAncestors(node: node?.right, target: target) {
            print(node?.data ?? -1)
            return true
        }
        return false
    }
}

let tree = BinaryTree()
tree.root = Node(val: 1)
tree.root?.left = Node(val: 2)
tree.root?.right = Node(val: 3)
tree.root?.left?.left = Node(val: 4)
tree.root?.left?.right = Node(val: 5)
tree.root?.left?.left?.right = Node(val: 6)
tree.root?.left?.left?.left = Node(val: 7)

tree.printTreeAncestors(node: tree.root, target: 6)
//Ans: True (4,2,1)
tree.printTreeAncestors(node: tree.root, target: 3)
//Ans: True (1)
tree.printTreeAncestors(node: tree.root, target: 8)
//Ans: False
