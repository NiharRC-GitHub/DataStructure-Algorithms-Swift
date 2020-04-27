/*
Created by nihar chadhei

Averages of Levels in Binary Tree
                       20
                    /     \
                   8       22
                /    \    /  \
               4     12  5    6
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

class QItem {
    var qNode: Node?
    init(node: Node) {
        qNode = node
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
    
    func printAverageOfLevel(rootNode: Node?) {
        guard let node = rootNode else {
            return
        }
        var queue = QOperation()
        queue.push(item: QItem(node: node))
        while !queue.qIsEmpty() {
            var sum = 0.0, count = 0.0
            let tempQueue =  QOperation()
            
            while !queue.qIsEmpty() {
                if let qItem = queue.pop() {
                    sum = sum + Double(qItem.qNode?.data ?? 0)
                    count += 1
                    
                    if let left = qItem.qNode?.left {
                        tempQueue.push(item: QItem(node: left))
                    }
                    if let right = qItem.qNode?.right {
                        tempQueue.push(item: QItem(node: right))
                    }
                }
            }
            queue = tempQueue
            print("\(sum/count) ")
        }
    }
}



let tree = BinaryTree()
tree.root = Node(val: 20)

tree.root?.left = Node(val: 8)
tree.root?.right = Node(val: 22)

tree.root?.left?.left = Node(val: 4)
tree.root?.left?.right = Node(val: 12)

tree.root?.right?.left = Node(val: 5)
tree.root?.right?.right = Node(val: 6)

tree.root?.left?.right?.left = Node(val: 10)
tree.root?.left?.right?.right = Node(val: 14)
tree.printAverageOfLevel(rootNode: tree.root)
