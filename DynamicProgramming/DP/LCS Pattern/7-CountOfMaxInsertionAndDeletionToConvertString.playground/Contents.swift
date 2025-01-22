/*
 Q. Count of max insertion and deletion to convert a string into target string
 Ex: let str1 = "abcde"
     let str2 = "dac"
 
 Solution:
 - What is the meaning of this question?
 - It is asking to convert the str1 to str2. To convrt this how many insertion or deletion required to the str1
 - With this way of asking the answer, it looks very complex.
 - But lets analyze and break it down.
 - When ever there are two string given we can try to link it with the LCS problem.
 - That's it. Now it is simple.
 - So lets find what is common in sequence from both the string.
 - If we found that then we can try to figure out what left after common sequence string in both str1 and str2.
 - That will give the result of Max deletion and insertion.
 - So get the LCS.
 - Get the length of LCS i.e, lenLcs
 - Get the length of str1 and str2 i.e, lenStr1 and lenStr2
 - Max insertion = lenStr2 - lenLcs
 - Max Deletion = lenStr1 - lenLcs
 */

struct MaxInsertionDeletion {
    func maxInsertionDeletion(_ str1: String, _ str2: String) {
        let str1Array = Array(str1.filter { $0 != " "})
        let str2Array = Array(str2.filter { $0 != " "})
        
        let (lenLcs, lcsString) = getLcsLengthAndString(str1Array, str2Array)
        print("Length of LCS is: \(lenLcs)")
        print("LCS is: \(lcsString)")
        print("Max Insertion is: \(str2Array.count - lenLcs)")
        print("Max Deletion is: \(str1Array.count - lenLcs)")
        let delition = str1Array.filter { !lcsString.contains($0) }
        let insertion = str2Array.filter { !lcsString.contains($0) }
        print("Deletion is: \(delition)")
        print("Insertion is: \(insertion)")
    }
    
    private func getLcsLengthAndString(_ str1Array: [Character], _ str2Array: [Character]) -> (Int, String) {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: str2Array.count + 1), count: str1Array.count + 1)
        for i in 1..<str1Array.count + 1 {
            for j in 1..<str2Array.count + 1 {
                if str1Array[i - 1] == str2Array[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        let lenLcs = dp[str1Array.count][str2Array.count]
        var lcsString: String = ""
        var i = str1Array.count
        var j = str2Array.count
        while i > 0 && j > 0 {
            if str1Array[i - 1] == str2Array[j - 1] {
                lcsString = String(str1Array[i - 1]) + lcsString
                i -= 1
                j -= 1
            } else if dp[i - 1][j] > dp[i][j - 1] {
                i -= 1
            } else {
                j -= 1
            }
        }
        let lcsLengthAndString: (Int, String) = (lenLcs, lcsString)
        return lcsLengthAndString
    }
}

let maxInsertionDeletion = MaxInsertionDeletion()
maxInsertionDeletion.maxInsertionDeletion("abcde", "dac")
//maxInsertionDeletion.maxInsertionDeletion("intention", "execution")
