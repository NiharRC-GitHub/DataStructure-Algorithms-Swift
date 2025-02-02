/*
 Q. Sequence pattern matching.
 Ex: let str1 = "ade"
     Let str2 = "abcde"
 Ans: true
 
 Analyzation:
 - What do you mean by sequence pattern matching?
 - It means the sequence of chars of str1 is equal to str2 or str2 is equal str1
 - Which concept provides the sequence matching solution?
 - LCS. LCS provides the longest common sequence.
 - We can use here LCS. It will provides the matching sequence
 - Then if we compare the length of LCS with str1 or str2 length and one of them matching means, One of the sequnce is matched fully in other
 */

import Foundation

struct SequenceMatching {
    func checkSequenceMatching(_ str1: String, _ str2: String) -> Bool {
        let str1Array = Array(str1.filter(\.isLetter))
        let str2Array = Array(str2.filter(\.isLetter))
        if str1Array.count == 0 || str2Array.count == 0 {
            return true
        }
        let lcsLength = lcsLength(str1Array, str2Array)
        return lcsLength == str1Array.count || lcsLength == str2Array.count
    }
        
    private func lcsLength(_ str1: [Character], _ str2: [Character]) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: str2.count + 1), count: str1.count + 1)
        for i in 1...str1.count {
            for j in 1...str2.count {
                if str1[i - 1] == str2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[str1.count][str2.count]
    }
}

let sequenceMatching = SequenceMatching()
print(sequenceMatching.checkSequenceMatching("ade", "abcde")) 
print(sequenceMatching.checkSequenceMatching("abc", "abc")) 
print(sequenceMatching.checkSequenceMatching("abf", "abcd"))
print(sequenceMatching.checkSequenceMatching("", "abc"))
