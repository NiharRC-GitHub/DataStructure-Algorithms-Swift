/*
 Q. Given a length of rod. And given price for each pieces. Asked partition or cutthe rod into such pieces that will return max profit or revenue.
    I/p:
        Price = [1, 5, 8, 9]
        length = 4
 Solu:
 - In 0/1 knapsack, always there is an input array, there may be a value array or not and there is a limit for capacity.
 - Here there is same as an input array, there may be a value array or not and here also limit for the length.
 - There the weight are already mentioned and you have to pick from them and once you pick the weight or not, second time you can't.
 - Here you can repeat the length. For example, you can sell the rod with length 4 without cutting or you can cut the rod into 4 picec with length 1 and sell to get max profit. So this nature indicates this problem as unbounded. If in the question, it asked to pick once any length and can't repeat, then it become 0/1 knapsack
 */

import Foundation

struct RodCuttingDP {
    func findMaxProfit(_ prices: [Int], _ length: Int) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: length + 1), count: length + 1)
        for i in 1...length {
            for j in 1...length {
                // there the condition was (if arr[i-1] <= j). Here the change because we are not accessing any extra array. Practically if you see, for i = 1, arr[i-1] == arr[0] == 1. So directly written as i<=j.
                if i <= j {
                    //"prices[i - 1] + dp[i][j - i]". This statement is from the 0/1 knapsack of "prices[i - 1] + dp[i - 1][j - arr[i-1]]". The change here is from dp[i-1] is replaced with dp[i] because of unbounded. And [j - arr[i-1]] is replace with [j - i] because the same reason as if condition above
                    dp[i][j] = max(prices[i - 1] + dp[i][j - i], dp[i - 1][j])
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        return dp[length][length]
    }
}

let dp = RodCuttingDP()
print(dp.findMaxProfit([1, 5, 8, 9], 4))
print(dp.findMaxProfit([1, 5, 8, 9, 10, 17, 17, 20, 24, 30], 8))
