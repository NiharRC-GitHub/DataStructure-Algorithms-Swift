/*
 Q1. Count of longest common substring
 - What does this mean?
 - Let's take an example
 Ex:
 s1 = "a b c d e"
 s2 = "a b f d h"
 Ans: "a b" i.e, length = 2
 
 Analysis:
 - What is th difference b/w subsequence and substring?
 - In the above example, longest subsequence = "a, b, d" and longest subString = "a b"
 */

struct LongestCommonsubstringDP {
    func getLongestCommonSubstringDP(s1: String, s2: String) -> String {
        let s1Array = Array(s1.filter({ $0 != " " }))
        let s2Array = Array(s2.filter({ $0 != " " }))
        if s1Array.isEmpty || s2Array.isEmpty {
            return ""
        }
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: s2Array.count + 1), count: s1Array.count + 1)
        var maxLength = 0
        var endIndex = 0
        for i in 1...s1Array.count {
            for j in 1...s2Array.count {
                if s1Array[i - 1] == s2Array[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                    maxLength = max(maxLength, dp[i][j]) // This is to comapre the previous max and current calculated value and hold the max value
                    endIndex = i
                } else {
                    dp[i][j] = 0 // In the Longest subsequence we used to take the Max of  max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        let startIndex = endIndex - maxLength
        let longestCommonSubstring = String(s1Array[startIndex..<endIndex])
        return longestCommonSubstring
    }
}

let longestCommonsubstringDP = LongestCommonsubstringDP()
print(longestCommonsubstringDP.getLongestCommonSubstringDP(s1: "a b c d e", s2: "a b f d h"))
print(longestCommonsubstringDP.getLongestCommonSubstringDP(s1: "a d f d h", s2: "a b f d h"))
print(longestCommonsubstringDP.getLongestCommonSubstringDP(s1: "a d f d h", s2: ""))
