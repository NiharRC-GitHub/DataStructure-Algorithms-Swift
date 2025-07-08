/*
 Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:

 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 The matching should cover the entire input string (not partial).

  

 Example 1:

 Input: s = "aa", p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:

 Input: s = "aa", p = "a*"
 Output: true
 Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
 Example 3:

 Input: s = "ab", p = ".*"
 Output: true
 Explanation: ".*" means "zero or more (*) of any character (.)".
  

 Constraints:

 1 <= s.length <= 20
 1 <= p.length <= 20
 s contains only lowercase English letters.
 p contains only lowercase English letters, '.', and '*'.
 It is guaranteed for each appearance of the character '*', there will be a previous valid character to match.
 */

func isMatch(_ s: String, _ p: String) -> Bool {
    let sChars = Array(s)
    let pChars = Array(p)
    let m = sChars.count
    let n = pChars.count

    // dp[i][j] = true if s[0..<i] matches p[0..<j]
    var dp = Array(
        repeating: Array(repeating: false, count: n + 1),
        count: m + 1
    )
    dp[0][0] = true  // Empty string matches empty pattern

    // Handle patterns like a*, a*b*, a*b*c*, etc.
    for j in 1...n {
        if pChars[j - 1] == "*" {
            dp[0][j] = dp[0][j - 2]
        }
    }

    for i in 1...m {
        for j in 1...n {
            if pChars[j - 1] == "." || pChars[j - 1] == sChars[i - 1] {
                dp[i][j] = dp[i - 1][j - 1]
            } else if pChars[j - 1] == "*" {
                // Zero occurrence of the character before '*'
                dp[i][j] = dp[i][j - 2]

                // If preceding character matches, or it's '.', include one occurrence
                if pChars[j - 2] == "." || pChars[j - 2] == sChars[i - 1] {
                    dp[i][j] = dp[i][j] || dp[i - 1][j]
                }
            }
        }
    }

    return dp[m][n]
}

print(isMatch("aa", "a"))
print(isMatch("aa", "a*"))
print(isMatch("ab", ".*"))
