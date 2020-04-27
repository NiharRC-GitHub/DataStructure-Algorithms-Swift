//: Playground - noun: a place where people can play

/*
 Created by nihar chadhei
 
 Left View of binary tree
        20
       /  \
     8     22
    / \      \
  5     3     25
       / \
     10   14
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
    var maxLevel = 0
    func printLeftView(rootNode: Node?, level: Int) {
        if rootNode == nil {
            return
        }
        
        if maxLevel < level {
            print(rootNode?.data ?? -1)
            maxLevel = level
        }
        printLeftView(rootNode: rootNode?.left, level: level + 1)
        printLeftView(rootNode: rootNode?.right, level: level + 1)
    }
}

let tree = BinaryTree()
tree.root = Node(val: 20)
tree.root?.left = Node(val: 8)
tree.root?.right = Node(val: 22)
tree.root?.left?.left = Node(val: 5)
tree.root?.left?.right = Node(val: 3)
tree.root?.right?.right = Node(val: 25)
tree.root?.left?.right?.left = Node(val: 10)
tree.root?.left?.right?.right = Node(val: 14)

tree.printLeftView(rootNode: tree.root, level: 1)
