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
 - In this we will solve this with half DP and half recursion.
 - What do es this mean?
 - In recursion, It never checked if the value already calculated or the problem already solved in any level. It again started solving the same again if it comes in any path.
 - In DP it stores the valu on each level in table.
 - So here we will solve it with recursive way and also store the value of each problem solved
 */

import Foundation
struct LongestCommonSubsequenceMomoization {
    var dpTable: [[Int]]
    let s1: String
    let s2: String
    let s1Length: Int
    let s2Length: Int
    init(s1: String, s2: String) {
        self.s1 = s1
        self.s2 = s2
        s1Length = s1.count
        s2Length = s2.count
        self.dpTable = Array(repeating: Array(repeating: -1, count: s2Length + 1), count: s1Length + 1)
    }
    
    mutating func countOfLongestCommonSubsequence() -> Int {
        return countOfLongestCommonSubsequence(s1: s1, s2: s2)
    }
    
    mutating private func countOfLongestCommonSubsequence(s1: String, s2: String) -> Int {
        let s1RemainingCount = s1.count
        let s2RemainingCount = s2.count
        if s1RemainingCount == 0 || s2RemainingCount == 0 {
            return 0
        }
        // If already the column has value then simply return here the value instead of recalculating again
        if dpTable[s1RemainingCount][s2RemainingCount] != -1 {
            return dpTable[s1RemainingCount][s2RemainingCount]
        }
        // Getting the remaining string by dropping the last character of both the string
        let s1Remaining = String(s1.dropLast())
        let s2Remaining = String(s2.dropLast())
        if let s1Last = s1.last,
           let s2Last = s2.last,
           s1Last.isLetter,
           s2Last.isLetter,
           s1Last == s2.last {
            // In recaursion approach we are simply returning here. But here we are storing the value to use the value if same problem apprears again
            dpTable[s1RemainingCount][s2RemainingCount] = countOfLongestCommonSubsequence(s1: s1Remaining, s2: s2Remaining) + 1
        } else {
            let count1 = countOfLongestCommonSubsequence(s1: s1Remaining, s2: s2)
            let count2 = countOfLongestCommonSubsequence(s1: s1, s2: s2Remaining)
            dpTable[s1RemainingCount][s2RemainingCount] = max(count1, count2)
        }
        return dpTable[s1RemainingCount][s2RemainingCount]
    }
}

var longestCommonSubsequenceMomoization = LongestCommonSubsequenceMomoization(s1: "a b c d e", s2: "a b f d h")
print(longestCommonSubsequenceMomoization.countOfLongestCommonSubsequence())
var longestCommonSubsequenceMomoization2 = LongestCommonSubsequenceMomoization(s1: "a b c d e", s2: "")
print(longestCommonSubsequenceMomoization2.countOfLongestCommonSubsequence())
