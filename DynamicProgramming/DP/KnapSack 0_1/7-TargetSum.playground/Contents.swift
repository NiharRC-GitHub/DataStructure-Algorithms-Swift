/*
 Q. Target sum
 - Here an array given and we need find out no. of ways to get the target sum value by doing some calculation of adding and subtracting the element of the array
 Ex:
 arr = [1, 1, 2, 3]
 targetSum = 1
 
 -> what is the qsn here
 - This means we have to do some calculation like {- 1 + 1 - 2 + 3} or {1 - 1 - 2 + 3} or {- 1 -1 -2 + 3} or ... and that will equal to 1
 - Let's solve one of them
 
 => - 1 + 1 - 2 + 3 == 1
 => (1 + 3) - (1 + 2) == 1
 =>    s1   -   s2    == targetSum
 
 - The other equation we know i.e,
    s1 + s2 = sum
 
 - let's solve this
 
 => s1 + s2 = sum
    s1 - s2 = diff
 ------------------
 => 2*s1 = sum + diff
 => s1 = sum + diff
        -----------
            2
 - So this s1 is the subset sum
 - if we get the count of subset sum 1(S1) that will be the answer.
 */

import Foundation

struct TargetSum {
    func findTargetSum(_ arr: [Int], _ targetSum: Int) -> Int {
        let len = arr.count
        let sum = arr.reduce(0, +)
        if len == 0 {
            return targetSum == 0 ? 1 : 0
        }
        if targetSum == sum {
            return 1
        }
        if sum < targetSum || (sum + targetSum) % 2 != 0 {
            return 0
        }
        let target = (sum + targetSum) / 2
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: target + 1), count: len + 1)
        for i in 0...len {
            dp[i][0] = 1
        }
        for i in 1...len {
            for j in 1...target {
               if arr[i - 1] <= j {
                    dp[i][j] = dp[i - 1][j - arr[i - 1]] + dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j]
               }
            }
        }
        return dp[len][target]
    }
}

let targetSum = TargetSum()
print(targetSum.findTargetSum([1, 1, 2, 3], 1))
print(targetSum.findTargetSum([1, 1, 2, 3], 2))
print(targetSum.findTargetSum([2, 3, 5, 8], 6))
