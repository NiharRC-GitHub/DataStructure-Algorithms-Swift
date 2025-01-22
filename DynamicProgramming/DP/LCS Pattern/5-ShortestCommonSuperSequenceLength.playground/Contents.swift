`/*
 Q. Find the shortest common super sequence count
  Ex:
    let str1 = "AGGTAB"
    let str2 = "GXTXAYB"
 
 Ans:
 "AGXGTXAYB". Length = 9
 
 Analysis:
 - What is the meaning of the question?
 - It means we need prepare a string which will super string of the given inputs(strings).
 - Means we can find both the input strings sequence in the final super strings.
 - And count of that sting is the result.
 - How we can get that?
 - The simple and stright froward answer is merge or concatenate both the string.
 - But this will give the longest one.
 - Then how can we get the shortest one?
 - We can get the shortest one if we remove the common letters i.e in same sequence in both the string.
 - This is nothing but finding the Longest common subsequence.
 - So the final approach is
    - Find length of both inputs(Ex: L1, L2)
    - Find the longest common subsequence and length of that.(Ex: LcsLength)
    - Result = L1 + L2 - LcsLength
 */`

import Foundation

struct ShortestCommonSuperSequenceCount {
    func findShortestCommonSuperSequenceCount(_ str1: String, _ str2: String) -> Int {
        let lcsLength = findLongestCommonSubsequence(str1, str2)
        return str1.count + str2.count - lcsLength
    }
    
    private func findLongestCommonSubsequence(_ str1: String, _ str2: String) -> Int {
        let s1Array = Array(str1.filter{ $0 != " "})
        let s2Array = Array(str2.filter{ $0 != " "})
        if s1Array.isEmpty || s2Array.isEmpty {
            return 0
        }
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: str2.count + 1), count: str1.count + 1)
        
        for i in 1...s1Array.count {
            for j in 1...s2Array.count {
                if s1Array[ i - 1] == s2Array[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return dp[str1.count][str2.count]
    }
}

let shortestCommonSuperSequenceCount = ShortestCommonSuperSequenceCount()
print(shortestCommonSuperSequenceCount.findShortestCommonSuperSequenceCount("AGGTAB", "GXTXAYB"))
