/*
 - The difference between 0-1 and unbounded knapsack is:
    -> In 0-1 knapsack, Either we will pick the item or not. If we once pick the item then the item will be not repeat again. Basically no reaccurance
    -> In Unbounded knapsack, the first condition is same. If we don't pick the item then we will never consider again. But in the second condition, there is a change. If a item already picked, that can be picked again. Basically multiple occurances.
 
 - In 0-1 knapsack, the second condition when the item can be picked
    if(arr[i-1] <= j) {
        dp[i][j] = max((value[i - 1] + dp[i -1][j - arr[i - 1]]), dp[i - 1][j])
    }
 
 - In unbounded knapsack, the second condition will be
    if(arr[i-1] <= j) {
        dp[i][j] = max((value[i - 1] + dp[i][j - arr[i - 1]]), dp[i - 1][j])
    }
    -> The change here is from "dp[i -1][j - arr[i - 1]]), dp[i - 1][j])" to "dp[i][j - arr[i - 1]]), dp[i - 1][j])"
    -> No need to go i - 1 after picking the item, We can again consider the i.
 */
