/*
 Q1. Print longest common subsequnce
 - What does this mean?
 - Let's take an example
 Ex:
 s1 = "a b c d e"
 s2 = "a b f d h"
 Ans: "a b d"
 */

struct PrintLongestCommonSubsequnce {
    func printLongestCommonSubsequnce(s1: String, s2: String) -> String {
        let s1Array = Array(s1.filter {$0 != " "})
        let s2Array = Array(s2.filter {$0 != " "})
        if s1Array.isEmpty || s2Array.isEmpty {
            return ""
        }
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: s2Array.count + 1), count: s1Array.count + 1)
        // This is to prepare the table
        for i in 1...s1Array.count {
            for j in 1...s2Array.count {
                if s1Array[i-1] == s2Array[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i][j-1], dp[i-1][j])
                }
            }
        }
        var i = s1Array.count
        var j = s2Array.count
        var result: [String] = []
        // This is to find the letters with the help of dp table
        while i > 0 && j > 0 {
            // if same then append the string and move -1 both i and j
            if s1Array[i-1] == s2Array[j-1] {
                result.append(String(s1Array[i-1]))
                i -= 1
                j -= 1
            } else if dp[i][j-1] > dp[i-1][j] {
                // Here we are checking which value is greater. Because when we create the table always we choose the max value when the chars are not same. So same we have to do here. Which ever value is max, that direction we have to move by -1.
                j -= 1
            } else {
                i -= 1
            }
        }
        return result.reversed().joined()
    }
}

let printLongestCommonSubsequnce = PrintLongestCommonSubsequnce()
print(printLongestCommonSubsequnce.printLongestCommonSubsequnce(s1: "a b c d e", s2: "a b f d h"))
