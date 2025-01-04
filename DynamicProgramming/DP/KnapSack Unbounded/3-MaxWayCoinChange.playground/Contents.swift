/*
 Q. Find max ways to get the amout from an coin array
 Ex: Coins Array = [1, 2, 3, 4]
     Amount = 4
 - Basically how many way we can achieve 4 from this array
 - Isn't it similar to sub set sum of 0/1 knapsack
 - Figure out no of subset from the given array and the sum of the elements of them equals to the amount
 - Here the only difference is that we can pick same item multiple times
 */

import Foundation

struct MaxWayCoinChangeDp {
    func maxWayCoinChange(_ coins: [Int], _ amount: Int) -> Int {
        let len = coins.count
        var dp: [[Int]] =  Array(repeating: Array(repeating: 0, count: amount+1), count: len + 1)
        for i in 0...len {
            dp[i][0] = 1
        }
        if amount == 0 {
            return 1
        }
        for i in 1...len {
            for j in 1...amount {
                if coins[i - 1] <= j {
                    dp[i][j] = dp[i][j - coins[i - 1]] + dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
            
        }
        return dp[len][amount]
    }
}

let maxWayCoinChangeDp = MaxWayCoinChangeDp()
print(maxWayCoinChangeDp.maxWayCoinChange([1, 2, 3], 4))
print(maxWayCoinChangeDp.maxWayCoinChange([1, 2, 3], 0))
