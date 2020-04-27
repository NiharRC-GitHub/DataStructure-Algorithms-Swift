//: Playground - noun: a place where people can play

//Print Nodes in Top View of Binary Tree with time complexity is O(n)

/*
 Created by nihar chadhei
 
            1
           / \
          2   3
           \    \
            4    11
             \
              5
               \
                6
                /
               7
              /
             8
            /
           9
          /
         10
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

class QItem {
    var qNode: Node?
    var horizontalDistance: Int?
    init(node: Node, hd: Int) {
        qNode = node
        horizontalDistance = hd
    }
}

class QOperation {
    var queue: [QItem] = []
    
    public func push(item: QItem) {
        queue.append(item)
    }
    public func pop() -> QItem? {
        return queue.removeFirst()
    }
    public func qIsEmpty() -> Bool {
        return queue.isEmpty
    }
}

class BinaryTree {
    var root: Node?
    func printTopView(rootNode: Node?) {
        guard let node = rootNode else {
            return
        }
        var hashSet = Set<Int>()
        let queue = QOperation()
        queue.push(item: QItem(node: node, hd: 0))
        while !queue.qIsEmpty() {
            if let qItem = queue.pop(), let hd = qItem.horizontalDistance {
                if !hashSet.contains(hd) {
                    print(qItem.qNode?.data ?? -1)
                    hashSet.insert(hd)
                }
                if let left = qItem.qNode?.left {
                    queue.push(item: QItem(node: left, hd: hd - 1))
                }
                if let right = qItem.qNode?.right {
                    queue.push(item: QItem(node: right, hd: hd + 1))
                }
            }
        }
        
    }
}

let tree = BinaryTree()
tree.root = Node(val: 1)
tree.root?.left = Node(val: 2)
tree.root?.right = Node(val: 3)
tree.root?.right?.right = Node(val: 11)
tree.root?.left?.right = Node(val: 4)
tree.root?.left?.right?.right = Node(val: 5)
tree.root?.left?.right?.right?.right = Node(val: 6)
tree.root?.left?.right?.right?.right?.left = Node(val: 7)
tree.root?.left?.right?.right?.right?.left?.left = Node(val: 8)
tree.root?.left?.right?.right?.right?.left?.left?.left = Node(val: 9)
tree.root?.left?.right?.right?.right?.left?.left?.left?.left = Node(val: 10)
print("Top View of tree")
tree.printTopView(rootNode: tree.root)

