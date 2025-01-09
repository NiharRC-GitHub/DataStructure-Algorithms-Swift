/*
 Q1. Count of longest common subsequnce
 - What does this mean?
 - Let's take an example
 Ex:
 s1 = "a b c d e"
 s2 = "a b f d h"
 Ans: "a b d" i.e, length = 3
 
 Analysis:
 - Here we will go with the DP approach
 */

import Foundation

struct LCSDP {
    func findCountLCSDP(s1: String, s2: String) -> Int {
        let s1Array = Array(s1.filter { $0 != " " }) // If we don't filter the space then it will give wrong result because it will consider all the space as a charecter
        let s2Array = Array(s2.filter { $0 != " " })
        
        if s1Array.isEmpty || s2Array.isEmpty {
            return 0
        }
        
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: s2Array.count + 1), count: s1Array.count + 1)
        
        for i in 1...s1Array.count {
            for j in 1...s2Array.count {
                if s1Array[i - 1] == s2Array[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[s1Array.count][s2Array.count]
    }
}

let lcsDP = LCSDP()
print(lcsDP.findCountLCSDP(s1: "a b c d e", s2: "a b f d h"))
print(lcsDP.findCountLCSDP(s1: "a b c d e", s2: ""))
