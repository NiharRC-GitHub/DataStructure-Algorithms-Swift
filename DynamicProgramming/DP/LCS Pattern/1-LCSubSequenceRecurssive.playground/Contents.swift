/*
 Q1. Count of longest common subsequnce
 - What does this mean?
 - Let's take an example
 Ex:
    s1 = "a b c d e"
    s2 = "a b f d h"
 Ans: "a b d" i.e, length = 3
 
 Analysis:
 - What is th difference b/w subsequence and substring?
 - In the above example, longest subsequence = "a, b, d" and longest subString = "a b"
 - So the difference is in subsequence we can pick same charecter from both the string that may or may not be continous but in substing that should be continous
 */

import Foundation

struct LongestCommonSubsequenceRecursion {
    func findLongestCommonSubsequenceCount(_ s1: String, _ s2: String) -> Int {
        // Base condition. If any of the string is empty or lenght is 0, then return 0
        if s1.isEmpty || s2.isEmpty {
            return 0
        }
        // Getting the remaining string by dropping the last character of both the string
        let s1Remaining = String(s1.dropLast())
        let s2Remaining = String(s2.dropLast())
        
        // Comparing last character of both the string
        if let s1Last = s1.last,
            let s2Last = s2.last,
            s1Last.isLetter,
            s2Last.isLetter,
            s1Last == s2.last {
            // if both the the character are same then drop last character of both the string and call the method again to check remaing
            // As we got one matching case so we are incresing the count by 1
            let count = findLongestCommonSubsequenceCount(s1Remaining, s2Remaining) + 1
            return count
        } else {
            // Because we don't find the last char of both the string same so we fall to the else condition
            // In this we can drop the last char of s1 and compare the remaining char of s1 with s2.
            // Or we can drop the last char of s2 and compare the remaining char of s2 with s1 sting
            // So here the there are two path that is one we can take whole s1 and s2 by dropping the last char Or s1 dropping the last char with whole s2 string.
            // As we are taking two path so we have to take the max of both to get the longest one count
            let count1 = findLongestCommonSubsequenceCount(s1Remaining, s2)
            let count2 = findLongestCommonSubsequenceCount(s1, s2Remaining)
            return max(count1, count2)
        }
    }
}

let longestCommonSubsequenceRecursion = LongestCommonSubsequenceRecursion()
print(longestCommonSubsequenceRecursion.findLongestCommonSubsequenceCount("a b c d e", "a b f d h"))
print(longestCommonSubsequenceRecursion.findLongestCommonSubsequenceCount("a b c d e", ""))
