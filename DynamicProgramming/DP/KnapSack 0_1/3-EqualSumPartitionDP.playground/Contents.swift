import Foundation
/*
 - This problem same as the sub set sum problem
 - There a traget was given, but here the ask is to figure out if there is a possibilities to partition the given array in twoo part that will give the sum of both array is equal
 - To figure out if this is possible or not, lets sum all the element of the array and %2. If the result will come 0, then it is possible. Otherise we can directly return false.
 - If true, then divide by 2 and find the number. And that will be the target sum number.
 - Now the problem is exactly same as sub set sum problem
 */

struct EqualSumPartitionDP {
    func equalSumPartitionDP(_ arr: [Int]) -> Bool {
        let sum = arr.reduce(0, +)
        if sum % 2 != 0 { return false }
        let targetSum = sum / 2
        let len = arr.count
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: targetSum + 1), count: len + 1)
        for i in 0...len {
            dp[i][0] = true
        }
        for i in 1...len {
            for j in 1...targetSum {
                if arr[i - 1] <= j {
                    dp[i][j] = dp[i - 1][j - arr[i - 1]] || dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        return dp[len][targetSum]
    }
}

let equalSumPartitionDP = EqualSumPartitionDP()
let val1 = equalSumPartitionDP.equalSumPartitionDP([1, 2, 3])
let val2 = equalSumPartitionDP.equalSumPartitionDP([1, 2, 3, 5])
print("val1: \(val1)")
print("val2: \(val2)")
