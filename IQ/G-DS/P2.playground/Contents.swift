/*
An arithmetic sequence is a list of numbers with a definite pattern. If you take any number in the sequence then subtract it from the previous one, the difference is always a constant.

A good arithmetic sequence is an arithmetic sequence with a common difference of either 1 or -1.

For example, [4, 5, 6] is a good arithmetic sequence. So is [6, 5, 4], [10, 9], or [-3, -2, -1]. But, [1, 2, 1] (no common difference) or [3, 7] (common difference is 4) is NOT.
Implied, any sequence that has only one element is a good arithmetic sequence.

For example, [4] is a good arithmetic sequence.
Given an integer array nums, return the sum of the sums of each subarray that is a good arithmetic sequence.

Example:

Given nums = [7, 4, 5, 6, 5]. Each of the following subarrays is a good arithmetic sequence:

[7], [4], [5], [6], [5],
[4, 5], [5, 6], [6, 5],
[4, 5, 6]
The sums of these subarrays are:

7, 4, 5, 6, 5,
4 + 5 = 9, 5 + 6 = 11, 6 + 5 = 11,
4 + 5 + 6 = 15
Thus, the answer is the sum of all the sums above, which is:

7 + 4 + 5 + 6 + 5 + 9 + 11 + 11 + 15 = 73
*/

func sumOfGoodArithmeticSubarrays(_ nums: [Int]) -> Int {
    var totalSum = 0
    let n = nums.count

    for start in 0..<n {
        var currentSum = nums[start]
        totalSum += currentSum

        var diff: Int? = nil

        for end in (start + 1)..<n {
            let currentDiff = nums[end] - nums[end - 1]

            if diff == nil {
                if abs(currentDiff) == 1 {
                    diff = currentDiff
                } else {
                    break
                }
            } else if currentDiff != diff {
                break
            }

            currentSum += nums[end]
            totalSum += currentSum
        }
    }

    return totalSum
}

// Example usage
let nums = [7, 4, 5, 6, 5]
let result = sumOfGoodArithmeticSubarrays(nums)
print("Result: \(result)") // Output should be 73

/*
 🔁 What does the code do?
 We're looping through all subarrays, starting from each index start and expanding to end.

 For each start from 0 to n-1, we:

 Try to build all possible subarrays [start...end] (up to n-1)

 At each step, we check the difference (nums[end] - nums[end - 1])

 Stop early if it's not consistently +1 or -1

 ✅ Worst-case Time Complexity
 Let’s assume the array is made entirely of a good sequence (e.g., [1,2,3,4,5,...]), so we never break early.

 In that case, for each start, we can extend the subarray all the way to the end.

 So we perform:

 mathematica
 Copy
 Edit
 (n-1) + (n-2) + (n-3) + ... + 1 = n(n-1)/2 = O(n²)
 ➡️ Worst-case time complexity: O(n²)

 This includes:

 O(n²) iterations to check subarrays

 O(1) operations per iteration (checking difference and updating sum)

 ✅ Best-case Time Complexity
 If all subarrays break early (e.g., array like [1, 10, 1, 10], where no good patterns exist), the loop breaks early almost every time.

 In that case, it’s closer to O(n) — one pass for the outer loop, and inner loop exits after 1 iteration.

 ➡️ Best case: O(n)

 ✅ Average-case Time Complexity
 Depends on the input pattern:

 In general, we can expect some subarrays to be valid and some not

 So realistically, O(n²) in average-case as well (though fewer operations due to early breaks)

 ✅ Space Complexity
 We’re using a few variables (diff, currentSum, totalSum) → all O(1)

 No extra data structures

 ➡️ Space Complexity: O(1)

 ✅ Summary

 Case    Time Complexity
 Best Case    O(n)
 Average Case    O(n²)
 Worst Case    O(n²)
 Space    O(1)
 */
