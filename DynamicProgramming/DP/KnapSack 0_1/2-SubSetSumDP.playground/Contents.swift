import Foundation
/*
 - The Problem is exactly same as 0-1 Knapsack
 - There the target was capacity and here it is to find if the any subset has the target sum
 - There an array was given for weight and here an of numbers
 - There an extra array was given for value, which was extra to calculate the value if the weight array allows to pick the value. But here the calculation will be with the number array.
 - There we have to find the max value bettwen picking the value and not picking the value. Here we have to OR(||) it to find true or false
 */

struct SubSetSumDP {
    func findSubSetSumDP(_ arr: [Int], _ target: Int) -> Bool {
        let len = arr.count
        // Initialise the 2D bool array with false the initial value
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: target + 1), count: len + 1)
        //Initialise the the table with true for j == 0, that means i in 0...len and for j == 0, true.
        // This is because, for target 0, it can be possible with any value from the array. Because, we don't expect anything for 0. So target 0, it will be true alway irrespective of any given array.
        // When the array is empty, that is for i == 0, and asked for some target value, it is not possible to get with empty array. Only for 0 target, it will be true, because, there is no expection for target 0. So with empty array also it is true. For other target like 1, 2, 3, ..., this will be false, because with empty array, it is not possible to get the target value i.e, greter than 0.
        for i in 0...len {
            dp[i][0] = true
        }
        for i in 1...len {
            for j in 1...target {
                if arr[i - 1] <= j {
                    dp[i][j] = dp[i - 1][j - arr[i - 1]] || dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        return dp[len][target]
    }
}

let dp = SubSetSumDP()
let val1 = dp.findSubSetSumDP([1, 2, 3], 7)
let val2 = dp.findSubSetSumDP([1, 2, 3], 6)
print("val1: \(val1)")
print("val2: \(val2)")
