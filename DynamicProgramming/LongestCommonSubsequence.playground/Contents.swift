/*
Created by nihar chadhei
 
 Longest Common Subsequence
 
 Ex. "ABC" and "ADC".
 Ans: 2
 
 Let's break this to problems to sub problem and resolve.
 
 LCS("ABC", "ADC")
 
    (Take the 1st char of both string)  +  (Keep rest in other part)
    = LCS("A", "A")                    +      LCS("BC", "DC")
 
    (As both char matching so value is 1)   +   (AS "B" and "D" is not matching so simply we remove both char, break rest into submodules and have to find max value)
    = 1                                     +     Max(LCS("C", "DC"), LCS("BC", "C"))
 
    {LCS("C", "DC") = Max(LCS("", "DC"), LCS("C", "C"))} , {LCS("BC", "C") = Max(LCS("C", "C"), LCS("BC", ""))}
    = 1 + Max( Max(LCS("", "DC"), LCS("C", "C"))   ,       Max(LCS("C", "C"), LCS("BC", "")))
 
    { LCS("", "DC") = 0, LCS("C", "C") = 1}
    = 1 + Max( Max(0, 1) , Max(1, 0)
 
    = 1 + Max(1, 1)
    = 1 + 1
    = 2(Answer)
 
 
 EX: "ADBCGIX" , "DYCBCTX" = DBCX
 Ans: 4
 
 Let's form the matix.
 
            ""      A       D       B       C       G       I       X
 
    ""      0       0       0       0       0       0       0       0
                        ("D", "AD")
    D       0       0       1       1       1       1       1       1
 
    Y       0       0       1       1       1       1       1       1
    
    C       0       0       1       1       2       2       2       2
 
    B       0       0       1       2       2       2       2       2
 
    C       0       0       1       2       3       3       3       3
 
    T       0       0       1       2       3       3       3       3
 
    X       0       0       1       2       3       3       3       4(Ans)
 
 
 */


//Resolve using Recursion

func lcsRecursion(str1: String, str2: String, l1: Int, l2: Int) -> Int {
    
    if (str1.count == 0 || str2.count == 0) {
        return 0
    }
    
    if str1.first == str2.first  {
        return 1 + lcsRecursion(str1: String(str1.suffix(l1)), str2: String(str2.suffix(l2)), l1: l1 - 1, l2: l2 - 1)
    } else {
        return max(lcsRecursion(str1: String(str1.suffix(l1)), str2: str2, l1: l1 - 1, l2: l2), lcsRecursion(str1: str1, str2: String(str2.suffix(l2)), l1: l1, l2: l2 - 1))
    }
}

let str1 = "ADBCGIX"
let str2 = "DYCBCTX"
let l1 = str1.count - 1
let l2 = str2.count - 1

let output = lcsRecursion(str1: str1, str2: str2, l1: l1, l2: l2)
print("Result :", output)

/*
 Result : 4
 */


//Resolving by matrix Calculation

func lcs(str1: String, str2: String, l1: Int, l2: Int) -> Int {
    let arrSize = l1 > l2 ? l1 : l2
    var K = Array(repeating: Array(repeating: 0, count: arrSize+1), count: arrSize+1)
    for i in 0...l1 {
        for j in 0...l2 {
            if (i == 0 || j == 0) {
                K[i][j] = 0
            } else if String(str1.suffix(l1 - (i - 1))).first == String(str2.suffix(l2 - (j - 1))).first {
                K[i][j] = K[i - 1][j - 1] + 1
            } else {
                K[i][j] = max(K[i - 1][j], K[i][j - 1])
            }
        }
    }
    return K[l1][l2]
}

let matrixStr1 = "ADBCGIX"
let matrixStr2 = "DYCBCTX"
let matrixL1 = str1.count
let matrixL2 = str2.count

let matrixOutput = lcs(str1: matrixStr1, str2: matrixStr2, l1: matrixL1, l2: matrixL2)
print("Result :", matrixOutput)

/*
Result : 4
*/
