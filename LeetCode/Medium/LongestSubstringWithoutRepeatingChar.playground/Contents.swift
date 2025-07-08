/*
 Given a string s, find the length of the longest substring without duplicate characters.

  

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

 */

/*
 Let’s walk through s = "abcabcbb"

 Step-by-step Execution:
 i    char    charIndexMap    prevIndex check    start updated?    start    i - start + 1    maxLength
 0    a          [:]                No                  No          0           1               1
 1    b         [a:0]               No                  No          0           2               2
 2    c         [a:0, b:1]          No                  No          0           3               3
 3    a    [a:0, b:1, c:2]    Yes, 0 ≥ 0            Yes → 0→1       1           3               3
 4    b    [a:3, b:1, c:2]    Yes, 1 ≥ 1            Yes → 1→2       2           3               3
 5    c    [a:3, b:4, c:2]    Yes, 2 ≥ 2            Yes → 2→3       3           3               3
 6    b    [a:3, b:4, c:5]    Yes, 4 ≥ 3            Yes → 3→5       5           2               3
 7    b    [a:3, b:6, c:5]    Yes, 6 ≥ 5            Yes → 5→7       7           1               3
 
 */

/*
 🔍 Step-by-Step Execution: "abcabdckbb"
 We'll keep track of:

 i: current index

 char: character at that index

 start: start of the current window

 charIndexMap: last seen positions of each character

 maxLength: longest substring length seen so far

 i    char    Duplicate in window?    start    charIndexMap before update    Updated start    Window Length    maxLength
 0    a             No                  0                —                          —               1               1
 1    b             No                  0                a:0                        —               2               2
 2    c             No                  0               a:0, b:1                    —               3               3
 3    a     Yes (seen at 0)             0           a:0, b:1, c:2                   1               3               3
 4    b     Yes (seen at 1)             1           a:3, b:1, c:2                   2               3               3
 5    d             No                  2           a:3, b:4, c:2                   —               4               ✅ 4
 6    c     Yes (seen at 2)             2           a:3, b:4, c:2, d:5              3               4               4
 7    k             No                  3           a:3, b:4, c:6, d:5              —               5               ✅ 5
 8    b     Yes (seen at 4)             3           a:3, b:4, c:6, d:5, k:7         5               4               5
 9    b     Yes (seen at 8)             5           a:3, b:8, c:6, d:5, k:7         9               1               5
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var charIndexMap = [Character: Int]()
    var maxLength = 0
    var start = 0
    let characters = Array(s)
    
    for (i, char) in characters.enumerated() {
        if let prevIndex = charIndexMap[char], prevIndex >= start {
            start = prevIndex + 1
        }
        charIndexMap[char] = i
        maxLength = max(maxLength, i - start + 1)
    }
    
    return maxLength
}
print(lengthOfLongestSubstring("abcabcbb"))
/*
 // to return the string
 
 class Solution {
     func longestSubstringWithoutRepeating(_ s: String) -> String {
         var charIndexMap = [Character: Int]()
         var maxLength = 0
         var start = 0
         var startOfMax = 0
         let characters = Array(s)

         for (i, char) in characters.enumerated() {
             if let prevIndex = charIndexMap[char], prevIndex >= start {
                 start = prevIndex + 1
             }

             charIndexMap[char] = i

             if i - start + 1 > maxLength {
                 maxLength = i - start + 1
                 startOfMax = start
             }
         }

         return String(characters[startOfMax..<(startOfMax + maxLength)])
     }
 }

 */
