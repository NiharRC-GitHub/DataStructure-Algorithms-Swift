/*
 - What is the problem here?
 - One part is sub set sum, i.e, definitely it ask for the subset sum value
 - 2nd part is asked for minimum. That means difference will be minimum
 - So the qsn means, find such 2 sub set, sum their element and substract. The result should be minimum.
 
Soln:
 - What could be the minimum? It will be always zero
 - What would be the maximum? The max will be the, half of the sum of all element in the array
 - Example: [1, 3, 4, 5]
 - Here the answer will be 1. How?
 - Possible sub set can be
 => {[1, 3, 4], [5]}, {[1, 3], [4, 5]}, {[1], [3, 4, 5]}, {[1, 4], [3, 5]}, {[1, 5], [3, 4]},...
 
 => {    8,      5 }, {   4,      9  }, { 1,      12   }, {   5,      8  }, {   6,      7  }
 
 =>        3                  5                 11                 3                  1(best min)
 
 - here definitely the answer is 1.
 - Below 1, the answer will be 0
 - When the result will be 0? This can be only possible if the the sum of the element of an array %2 will result 0. That means the array can be divide into 2 sub array and the sum of their element is equal.
 - This at least giving the hints that we need to first find the sum of the element of array.
 - Then the next hint is, the max value will for diff will be half of the sum.
 - With this hint we can solve the subset find DP upto half of the sum. i.e, targetSum = sum/2
 - The last row of the table will tell which of the target subset sum is possible with the given input.
 - Here the sum is 1 + 3 + 4 + 5 = 13
 - half of the sum is 13/2 = 6.5 = 6
 - here the DP will run for len = arr.lenght = 4 and sum = 6
 - The table will be
    
        0   1   2   3   4   5   6
 
    0
 
    1
 
    2
 
    3
 
    4
 
 - The 4th number row will tell which subset sum is possible with the input array and wich not.
 - Based on the we can run an loop from the last element and find the fist `True` case and that is the number.
 - Multiply that number with 2 and substract that from the array element sum. That will give the result.
 */

import Foundation

struct MinimumSubsetSum {
    func findMinimumSubsetSum(_ arr: [Int]) -> Int {
        let len = arr.count
        let sum = arr.reduce(0, +)
        let targetSum = sum / 2
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
        // this is the loop to find first subset sum
        for i in stride(from: targetSum, through: 0, by: -1) { // OR we can do {for i in (0...len).reversed()} {
            if dp[len][i] {// which ever first subset sum is true
                return sum - i * 2
            }
        }
        return 0
    }
}

let minimumSubsetSum = MinimumSubsetSum()
let val1 = minimumSubsetSum.findMinimumSubsetSum([1, 3, 4, 5])
let val2 = minimumSubsetSum.findMinimumSubsetSum([1, 2, 3])
let val3 = minimumSubsetSum.findMinimumSubsetSum([1, 2, 3, 9])
print("val1: \(val1)")
print("val2: \(val2)")
print("val3: \(val3)")

