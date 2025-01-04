import Foundation

//#### Recursive Approach

struct Recursive {
    func knapsackRecursive(weights: [Int], values: [Int], capacity: Int, size: Int) -> Int {
        if size == 0 || capacity == 0 { // if any one of them reach to zero, then simply return as there is nothing to check or compute further. And this condition will break the recursive loop
            return 0
        }
        if weights[size - 1] <= capacity { // Check if the weight is less than capacity
            // if the size is less than the capacity then check if we can pick the value or not
            // Find the max value between picking the the value or without picking the value
            // If we pick the vlaues, then substract the weight from capacity, otherwise don't.
            // Both the cases, decrease the size by one
            return max(values[size - 1] + knapsackRecursive(weights: weights, values: values, capacity: capacity - weights[size - 1], size: size - 1), knapsackRecursive(weights: weights, values: values, capacity: capacity, size: size - 1))
        } else {
            // Don't do anything. Simply decrease the size by one and call the method again
            return knapsackRecursive(weights: weights, values: values, capacity: capacity, size: size - 1)
        }
    }
}

let recursive = Recursive()
let weights: [Int] = [1, 2, 3, 4, 5, 6, 7]
let values: [Int] = [1, 3, 5, 7, 8, 12, 13]
let capacity: Int = 10
let size: Int = weights.count
let res = recursive.knapsackRecursive(weights: weights, values: values, capacity: capacity, size: size)
print("Capacity: \(capacity), Result: ", res)

// ####################################

//let weights: [Int] = [1, 2, 3, 4, 5, 6, 7]
//let values: [Int] = [1, 3, 5, 7, 8, 12, 13]
//let capacity: Int = 10
//
//// Recursive function to calculate the maximum value
//func knapsackRecursive(i: Int, w: Int) -> Int {
//    // Base case: No items left or no capacity left
//    if i == 0 || w == 0 {
//        return 0
//    }
//    
//    // If the current item can be included (weight[i-1] <= w)
//    if weights[i-1] <= w {
//        let includeItem = values[i-1] + knapsackRecursive(i: i-1, w: w - weights[i-1]) // Include item
//        let excludeItem = knapsackRecursive(i: i-1, w: w) // Exclude item
//        return max(includeItem, excludeItem) // Return the max value of including or excluding the item
//    } else {
//        // If the current item cannot be included, exclude it
//        return knapsackRecursive(i: i-1, w: w)
//    }
//}
//
//// Call the recursive function
//let maxValue = knapsackRecursive(i: weights.count, w: capacity)
//print("Maximum value: \(maxValue)")


//let weights: [Int] = [1, 2, 3, 4, 5, 6, 7]
//let values: [Int] = [1, 3, 5, 7, 8, 12, 13]
//let capacity: Int = 10
//
//// Create a 2D DP table to store the maximum value for each capacity and number of items
//var dp = Array(repeating: Array(repeating: 0, count: capacity + 1), count: weights.count + 1)
//
//// Fill the DP table
//for i in 1...weights.count {
//    for w in 0...capacity {
//        if weights[i - 1] <= w {
//            // Option 1: Include the item i
//            dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1])
//        } else {
//            // Option 2: Exclude the item i
//            dp[i][w] = dp[i - 1][w]
//        }
//    }
//}
//
//// The result is the maximum value for the full capacity and all items
//print("Maximum value: \(dp[weights.count][capacity])")
