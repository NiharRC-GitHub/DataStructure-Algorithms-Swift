import Foundation

struct DP {
    func knapsackDP(weight: [Int], value: [Int], capacity: Int) -> Int {
        let size = weight.count
        var dp = Array(repeating: Array(repeating: 0, count: capacity + 1), count: size + 1)
        for i in 1...size {
            for j in 1...capacity {
                if weight[i - 1] <= j {
                    let maxValue = max(dp[i - 1][j], dp[i - 1][j - weight[i - 1]] + value[i - 1])
                    dp[i][j] = maxValue
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        return dp[size][capacity]
    }
}

let dp = DP()
let weights: [Int] = [1, 2, 3, 4, 5, 6, 7]
let values: [Int] = [1, 3, 5, 7, 8, 12, 13]
let capacity: Int = 10
let maxValue = dp.knapsackDP(weight: weights, value: values, capacity: capacity)
print(maxValue)
