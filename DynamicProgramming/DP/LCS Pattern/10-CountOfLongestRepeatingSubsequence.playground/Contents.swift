/*
 Q. Find count of longest Repeating subsequence
 Ex: let str = "aabebcdd"
 Ans: "abd", length 3
 
 Solution:
 - Let's breakdown the question
 - Longest subsequence, Means this is LCS problem
 - Repeating, Means we need to find any LCS which is repeating in the string
 - For LCS the formula is
    if Str1[i-1] == str2[j-1]
 - But this will only give the longest subsequence
 - Here we need to check that if it's repeating in the string again or not
 - Also there are 2 string input to find the LCS
 - Here only one.
 - So in that case we have to take the same string as the sencond string.
 - With the above formula all the chars will be same because the 2nd string is same as the 1st string.
 - So the above formula will not work.
 - That will definitely give the LCS but not the result we are searching.
 - Need to add some more condition and formula to find our result
 - Let's back track the answer "abd"
 - If we check the answer, then it is clearly visible that the LCS chars are repeated i.e, they are present in the string more than once. The chars are not picked which is present once.
 - So this means the chars are same when i and j are pointing to same index and there are cases where chars are same when i and j points to different index.
 - And this is the answer and this is the extra condition.
 - So the final condition will be
    if Str1[i-1] == str2[j-1] && i != j
 */

struct LongestRepeatingSubsequence {
    func countLongestRepeatingSubsequence(_ str: String) -> Int {
        let str1 = Array(str.filter { $0 != " " })
        let count = str1.count
        
        // If the string is empty after removing spaces, return 0
        if count == 0 {
            return 0
        }
        
        // Initialize the DP table
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: count + 1), count: count + 1)
        
        // Fill the DP table
        for i in 1...count {
            for j in 1...count {
                if str1[i - 1] == str1[j - 1] && i != j {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        // Return the length of the longest repeating subsequence
        return dp[count][count]
    }
}

let longestRepeatingSubsequence = LongestRepeatingSubsequence()
print(longestRepeatingSubsequence.countLongestRepeatingSubsequence("aabebcdd"))
print(longestRepeatingSubsequence.countLongestRepeatingSubsequence("abcde"))
print(longestRepeatingSubsequence.countLongestRepeatingSubsequence("bbbbb")) 
