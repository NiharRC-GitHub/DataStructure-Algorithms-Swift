import Foundation
/*
 - In this problem it asked to find how many subset sum has equal to given target sum
 - This is similar to sub set sum but there we were checking if any subset sum has equal to the given target sum
 - There we were taking a DP table of boolean value and the table last item had the answer with True/False
 - Here a minor change to that.
 - Instead of a Boolean table table, we will take a Int table
 - There the first row initialised with False, here it will be with 0 (i == 0)
 - There the first coloumn initialised with True, here it will be with 1 (j == 0)
 - There it was a OR(||) condition between picking the value and not picking the value, here it will be a addition when the if condition true
 */

struct CountOfSubsetSumDP {
    func findCountOfSubsetSumDP(_ arr: [Int], _ target: Int) -> Int {
        let len = arr.count
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
 let countOfSubsetSumDP = CountOfSubsetSumDP()
print(countOfSubsetSumDP.findCountOfSubsetSumDP([1, 2, 2, 4], 4))
