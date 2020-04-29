/*
Created by nihar chadhei

Print Binary Tree levels in sorted order
                       20
                    /     \
                   8       22
                /    \    /  \
               4     12  5    6
                    /  \
                10    14
                
 
 
 
*/

class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(val: Int) {
        data = val
        left = nil
        right = nil
    }
}

class QItem {
    var qNode: Node
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
    
    func printEachLevelInSortedOrder(rootNode: Node?) {
        guard let node = rootNode else {
            return
        }
        
        var queue = QOperation()
        queue.push(item: QItem(node: node))
        while !queue.qIsEmpty() {
            var dataArray = [Int]()
            let tempQueue = QOperation()
            
            while !queue.qIsEmpty() {
                if let qItem = queue.pop() {
                    dataArray.append(qItem.qNode.data)
                    if let node = qItem.qNode.left {
                        tempQueue.push(item: QItem(node: node))
                    }
                    if let node = qItem.qNode.right {
                        tempQueue.push(item: QItem(node: node))
                    }
                }
            }
            queue = tempQueue
            printSortedValue(arr: dataArray)
        }
    }
    
    func printSortedValue(arr: [Int]) {
        var tempArray = arr
        let count = arr.count
        var i = 0
        for _ in i..<count-1 {
            var j = 0
            for _ in j..<(count - i - 1) {
                if tempArray[j] > tempArray[j+1] {
                    let temp = tempArray[j]
                    tempArray[j] = tempArray[j+1]
                    tempArray[j+1] = temp
                }
                j += 1
            }
            i += 1
        }
        print(tempArray)
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

tree.printEachLevelInSortedOrder(rootNode: tree.root)
