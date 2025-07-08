/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

  

 Example 1:


 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 Example 2:

 Input: l1 = [0], l2 = [0]
 Output: [0]
 Example 3:

 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0)
        var s1 = l1
        var s2 = l2
        var current = head
        var remaining = 0
        while s1 != nil || s2 != nil {
            let n1 = s1?.val ?? 0
            let n2 = s2?.val ?? 0
            
            let sum  = remaining + n1 + n2
            remaining = sum/10
            
            current.next = ListNode(sum % 10)
            current = current.next!
            
            if let nextS1 = s1 {
                s1 = s1?.next
            }
            if let nextS2 = s2 {
                s2 = s2?.next
            }
        }
        if remaining > 0 {
            current.next = ListNode(remaining)
        }
        return head.next
    }
}

let solution = Solution()
let result = solution.addTwoNumbers(
    ListNode(2, ListNode(4, ListNode(3))),
    ListNode(5, ListNode(6, ListNode(4)))
)

if let result = result {
    var node: ListNode? = result
    while node != nil {
        print(node!.val, terminator: " ")
        node = node!.next
    }
    print()
} else {
    print("nil")
}
