/*
 Q. Asked to find minimum number of coins to get the target value
 Ex: coins = [1, 2, 3]
     target = 5
 - Ans: 2 i.e, 2 + 3
 
 Solun:
 - If we can comare this is simillar to the subset sum problem but the ask is little different
 - Asked to find a subset sum that has min number of elements
 - Mostly in subset sum problem we used to initialise the first row with 1 or True.
 - Here we have to initialise the first row with Int.max - 1. -1 because when we will fill the rest of the row and column, we have to do +1 and find the min.
 */

import Foundation

struct MinCoinDp {
    func minCoinDp(_ coins: [Int], _ target: Int) -> Int {
        let len = coins.count
        var dp: [[Int]] = Array(repeating: Array(repeating: Int.max-1, count: target + 1), count: len + 1)
        for i in 0...len {
            dp[i][0] = 0
        }
        if target == 0 {
            return 0
        }
        for i in 1...len {
            for j in 1...target {
                if coins[i-1] <= j {
                    // Every time we move forward, either we will cosider the item or not. If we consider the item then add 1 and find the min between privious and the new
                    dp[i][j] = min(1 + dp[i][j-coins[i-1]], dp[i-1][j])
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        return dp[len][target] != Int.max - 1 ? dp[len][target] : -1
    }
}
 let minCoinDp = MinCoinDp()
print(minCoinDp.minCoinDp([1, 2, 3], 5))
print(minCoinDp.minCoinDp([1, 2, 5], 11))
print(minCoinDp.minCoinDp([1, 2, 10], 28))
print(minCoinDp.minCoinDp([5, 10], 3))
print(minCoinDp.minCoinDp([3], 9))
print(minCoinDp.minCoinDp([10, 20, 50], 5))
print(minCoinDp.minCoinDp([1, 5, 7, 9], 20))
print(minCoinDp.minCoinDp([1, 5, 7, 9], 0))
