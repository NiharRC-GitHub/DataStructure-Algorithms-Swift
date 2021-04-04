//: Playground - noun: a place where people can play


/*
 Created by nihar chadhei
 
 Print Lowest Common ancestor of binary tree
                      20
                     /  \
                   8     22
                 /   \
                4    12
                    /  \
                  10    14
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
    
    func printLowestCommonAncestors(node: Node?, n1: Int, n2: Int) -> Node? {
        
        if node == nil {
            return nil
        }
        if let data = node?.data, data > n1 && data > n2 {
            return printLowestCommonAncestors(node: node?.left, n1: n1, n2: n2)
        }
        if let data = node?.data, data < n1 && data < n2 {
            return printLowestCommonAncestors(node: node?.right, n1: n1, n2: n2)
        }
        return node
    }
}

let tree = BinaryTree()
tree.root = Node(val: 20)
tree.root?.left = Node(val: 8)
tree.root?.right = Node(val: 22)
tree.root?.left?.left = Node(val: 4)
tree.root?.left?.right = Node(val: 12)
tree.root?.left?.right?.left = Node(val: 10)
tree.root?.left?.right?.right = Node(val: 14)

var node = tree.printLowestCommonAncestors(node: tree.root, n1: 10, n2: 14)
print(node?.data ?? -1)

//Ans: 12

node = tree.printLowestCommonAncestors(node: tree.root, n1: 4, n2: 14)
print(node?.data ?? -1)
//Ans: 8

node = tree.printLowestCommonAncestors(node: tree.root, n1: 4, n2: 22)
print(node?.data ?? -1)
//Ans: 20
