//: Playground - noun: a place where people can play
/*
 Created by nihar chadhei
 
 Bottom View of binary tree
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
class QItem {
    var qNode: Node?
    var horizontalDistance: Int?
    init(node: Node?, hd: Int?) {
        qNode = node
        horizontalDistance = hd
    }
}
class QOperation {
    var queue: [QItem] = []
    func push(item: QItem) {
        queue.append(item)
    }
    func pop() -> QItem? {
        return queue.removeFirst()
    }
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}
class BinaryTree {
    var root: Node?
    func printBottomView(rootNode: Node?) {
        guard let node = rootNode else {
            return
        }
        var hashTable = [Int: Node]()
        let queue = QOperation()
        queue.push(item: QItem(node: node, hd: 0))
        
        while !queue.isEmpty() {
            if let qItem = queue.pop(), let hd = qItem.horizontalDistance {
                hashTable[hd] = qItem.qNode
                if let left = qItem.qNode?.left {
                    queue.push(item: QItem(node: left, hd: hd - 1))
                }
                if let right = qItem.qNode?.right {
                    queue.push(item: QItem(node: right, hd: hd + 1))
                }
            }
        }
        for (_, value) in hashTable {
            print("\(String(describing: value.data))")
        }
    }
}

let tree = BinaryTree()
tree.root = Node(val: 20)
tree.root?.left = Node(val: 8)
tree.root?.right = Node(val: 22)
tree.root?.right?.right = Node(val: 25)
tree.root?.left?.left = Node(val: 5)
tree.root?.left?.right = Node(val: 3)
tree.root?.left?.right?.left = Node(val: 10)
tree.root?.left?.right?.right = Node(val: 14)
print("Bottom view tree")
tree.printBottomView(rootNode: tree.root)

