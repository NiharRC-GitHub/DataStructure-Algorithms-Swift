/*
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

 The overall run time complexity should be O(log (m+n)).

  

 Example 1:

 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 Example 2:

 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 2.50000
 Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

 */

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let A = nums1
        let B = nums2

        // Ensure A is the smaller array
        let m = A.count
        let n = B.count
        if m > n {
            return findMedianSortedArrays(B, A)
        }

        var low = 0
        var high = m

        while low <= high {
            let partitionA = (low + high) / 2
            let partitionB = (m + n + 1) / 2 - partitionA

            let maxLeftA = (partitionA == 0) ? Int.min : A[partitionA - 1]
            let minRightA = (partitionA == m) ? Int.max : A[partitionA]

            let maxLeftB = (partitionB == 0) ? Int.min : B[partitionB - 1]
            let minRightB = (partitionB == n) ? Int.max : B[partitionB]

            if maxLeftA <= minRightB && maxLeftB <= minRightA {
                // Found correct partition
                if (m + n) % 2 == 0 {
                    return Double(max(maxLeftA, maxLeftB) + min(minRightA, minRightB)) / 2.0
                } else {
                    return Double(max(maxLeftA, maxLeftB))
                }
            } else if maxLeftA > minRightB {
                high = partitionA - 1
            } else {
                low = partitionA + 1
            }
        }

        // Invalid input
        return 0.0
    }
}
