/*
 Q. Find the longest palindromic subsequence
 Example:
    let str = "ambcba"
 Ans: Answer here is "abcba" and length is 5
 
 Solution:
 - What is palindrom?
 - The give string becomes same after reverse
 - Here the question is to find any subsequence from the string which will be palindrom and became the longest one
 - So the term here is find the longest subsequence. Does that mean we can use here the LCS?
 - Yes.
 - For LCS there will always 2 input string. But here only one given. So what is the 2nd input?
 - The second input can be found from the question itself. i.e, from palindrom.
 - How we can find a string became palindrom?
 - Already mentioned. By Reversing the string and comparing. So reversing is the term which will provide us the 2nd input string.
 - So 1st input is given, i.e,
    let str = "ambcba"
 - Second will be the reverse of it. i.e,
    let revStr = "abcbma"
 - Now if we will get the LCS, that will be became the longest palindrom.
 */

struct LongestPalindromicSubsequence {
    func findLongestPalindromicSubsequence(_ str: String) {
        if str.isEmpty {
            return
        }
        let revStr = String(str.reversed())
        let lps = findLongestCommonSubsequence(str, revStr)
        print("Longest Palindromic Subsequence: \(lps)")
        print("Length of Longest Palindromic Subsequence: \(lps.count)")
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

let longestPalindromicSubsequence = LongestPalindromicSubsequence()
longestPalindromicSubsequence.findLongestPalindromicSubsequence("ambcba")
longestPalindromicSubsequence.findLongestPalindromicSubsequence("bbabcbab")
