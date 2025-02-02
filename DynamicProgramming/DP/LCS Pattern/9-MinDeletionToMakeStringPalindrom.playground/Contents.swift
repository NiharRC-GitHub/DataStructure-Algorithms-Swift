/*
 Q. Minimum number of deletion to make a string to make palindrom
 Example:
    let str = "ambcba"
 Ans: Answer here is "abcba" and min delition is 1 i.e, m
 
 Solution:
 - From the answer we can see that the output is same as the question "Find the longest palindromic subsequence"
 - So if we follow same approach and then substract the length of result string length from the input string length, we will get the answer.
 */

struct MinDeletionToMakeStringPalindrome {
    func findMinDeletionToMakeStringPalindrome(_ str: String) {
        if str.isEmpty {
            return
        }
        let revStr = String(str.reversed())
        let lps = findLongestCommonSubsequence(str, revStr)
        print("Palindromic string: \(lps)")
        print("Minimum deletion: \(str.count - lps.count)")
    }
    
    private func findLongestCommonSubsequence(_ text1: String, _ text2: String) -> String {
        let charArray1 = Array(text1.filter { !$0.isWhitespace })
        let charArray2 = Array(text2.filter { !$0.isWhitespace })
        
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: charArray2.count + 1), count: charArray1.count + 1)
        
        for i in 1..<charArray1.count {
            for j in 1..<charArray2.count {
                if charArray1[i - 1] == charArray2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        var result: String = ""
        var i = charArray1.count
        var j = charArray2.count
        while i > 0 && j > 0 {
            if charArray1[i - 1] == charArray2[j - 1] {
                result = String(charArray1[i - 1]) + result
                i -= 1
                j -= 1
            } else if dp[i - 1][j] > dp[i][j - 1] {
                i -= 1
            } else {
                j -= 1
            }
        }
        return result
    }
}

let minDeletionToMakeStringPalindrome = MinDeletionToMakeStringPalindrome()
minDeletionToMakeStringPalindrome.findMinDeletionToMakeStringPalindrome("ambcba")
