/*
 Given a string s, return the longest palindromic substring in s.

  

 Example 1:

 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:

 Input: s = "cbbd"
 Output: "bb"

 */

func longestPalindrome(_ s: String) -> String {
    if s.isEmpty {
        return ""
    }
    
    let revStr = String(s.reversed())
    return findLCSubstring(s1: s, s2: revStr)
}

func findLCSubstring(s1: String, s2: String) -> String {
    let cArr1 = Array(s1.filter { !$0.isWhitespace })
    let cArr2 = Array(s2.filter { !$0.isWhitespace })
    let l1 = cArr1.count
    let l2 = cArr2.count
    
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: l2+1), count: l1+1)
    var maxLen = 0
    var lastIndex = 0
    
    for i in 1 ... l1 {
        for j in 1 ... l2 {
            if cArr1[i-1] == cArr2 [j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
                
                let len = dp[i][j]
                
                let originalStart = i - len // This is different from the normal substring finding problem
                let reversedStart = l1 - j
                
                if originalStart == reversedStart {
                    if len > maxLen {
                        maxLen = len
                        lastIndex = i
                    }
                }
            } else {
                dp[i][j] = 0
            }
        }
    }
    let startIndex = lastIndex - maxLen
    return String(cArr1[startIndex..<lastIndex])
}
