/*
 Q. Count the number of subset with a given diff
 - Again same ask for the subset sum
 - But here a number will be given and that is the subset sum diff
 - We need to find out how many subset sum diff will eqaul to that number.

 Soln:
 
 - The last row of subset sum dp table provides subset sum possibilities for all the target
 - But with that it is not possible to figure out how man subset sum diff will equal to the number given.
 - Let's understand the qsn and try to find some equation
 - We now if we will add any 2 sub array sum of the given array it will be same as the elements sum of that array
    i.e, s1 + s2 = Sum
 - Qsn given s1 - s2 = diff
 - let's solve this
 
 => s1 + s2 = sum
    s1 - s2 = diff
 ------------------
 => 2*s1 = sum + diff
 => s1 = sum + diff
        -----------
            2
 - So this s1 is the subset sum
 - if we get the count of subset sum 1(S1) that will be the answer. Because there will be the same no of S2 as well.
 */

import Foundation

struct SubsetSumDiffCount {
    func countSubsetSumDiff(_ arr: [Int], _ diff: Int) -> Int {
        guard !arr.isEmpty else { return 0 }
        
        let sum = arr.reduce(0, +)
        
        if sum == diff { return 1 }
        if sum < diff || (sum + diff) % 2 != 0 { return 0 }
        
        let target = (sum + diff) / 2
        
        let len = arr.count
        
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: target + 1), count: arr.count + 1)
        for i in 0...len {
            dp[i][0] = 1
        }
        for i in 1...len {
            for j in 1...target {
                if j >= arr[i - 1] {
                    dp[i][j] = dp[i - 1][j - arr[i - 1]] + dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        
        return dp[len][target]
    }
}

let dp = SubsetSumDiffCount()
let val1 = dp.countSubsetSumDiff([1, 1, 2, 3], 1)
let val2 = dp.countSubsetSumDiff([1, 2, 3, 4, 5], 2)
let val3 = dp.countSubsetSumDiff([2, 3, 5, 8], 6)
print(val1)
print(val2)
print(val3)
