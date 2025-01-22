/*
 Q. Find the shortest common super sequence and print it
  Ex:
    let str1 = "AGGTAB"
    let str2 = "GXTXAYB"
 
 Ans:
 "AGXGTXAYB"
 
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
 - This is how we are getting the length.
 - But how to print it?
 - We need to recall the printing structure of LCS
 - First we prepare the DP table to find the LCS
 - Then we traverse the table with i and j
 - when the chars are same we used to store the value in a string.
 - In case it is not same, then we used to check which value in DP table is greater. We used to move in that direction by i-1 or j-1. But we don't store that value and print the string in reverse at the end
 - But in this case after moving to that i or j, we need to pick that char as well
 - After the while end we need to append the rest of pending chars from str1 or str2
 */

struct PrintShortestCommonSuperSequence {
    func getShortestCommonSuperSequence(str1: String, str2: String) -> String {
        let lcsDpTabel = getLongestCommonSubSequenceDp(str1: str1, str2: str2)
        if lcsDpTabel.isEmpty {
            return ""
        }
        let strArray1 = Array(str1.filter{$0 != " "})
        let strArray2 = Array(str2.filter{$0 != " "})
        var i = strArray1.count
        var j = strArray2.count
        var result: String = ""
        while i > 0 && j > 0 {
            if strArray1[i-1] == strArray2[j-1] {
                result.append(strArray1[i-1])
                i -= 1
                j -= 1
            } else if lcsDpTabel[i][j-1] > lcsDpTabel[i-1][j] {
                result.append("\(strArray2[j-1])")
                j -= 1
            } else {
                result.append("\(strArray1[i-1])")
                i -= 1
            }
        }
        while i > 0 {
            result.append(strArray1[i - 1])
            i -= 1
        }
        while j > 0 {
            result.append(strArray2[j - 1])
            j -= 1
        }
        return String(result.reversed())
    }
    
    private func getLongestCommonSubSequenceDp(str1: String, str2: String) -> [[Int]] {
        let strArray1 = Array(str1.filter{$0 != " "})
        let strArray2 = Array(str2.filter{$0 != " "})
        if strArray1.isEmpty || strArray2.isEmpty {
            return [[]]
        }
        var dpTable: [[Int]] = Array(repeating: Array(repeating: 0, count: strArray2.count + 1), count: strArray1.count + 1)
        
        for i in 1...strArray1.count {
            for j in 1...strArray2.count {
                if strArray1[i-1] == strArray2[j-1] {
                    dpTable[i][j] = dpTable[i-1][j-1] + 1
                } else {
                    dpTable[i][j] = max(dpTable[i-1][j], dpTable[i][j-1])
                }
            }
        }
        return dpTable
    }
}

let printShortestCommonSuperSequence = PrintShortestCommonSuperSequence()
print(printShortestCommonSuperSequence.getShortestCommonSuperSequence(str1: "abcde", str2: "abc"))
print(printShortestCommonSuperSequence.getShortestCommonSuperSequence(str1: "AGGTAB", str2: "GXTXAYB"))
