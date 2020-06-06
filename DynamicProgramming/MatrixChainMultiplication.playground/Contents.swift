/*
Created by nihar chadhei
 
Matrix Chain Multiplication.
 
Example: 5x4, 4x6, 6x2, 2x7
 i.e, M1 = 5x4
      M2 = 4x6
      M3 = 6x2
      M4 = 2x7
 
 Matrix Multiplication:
        The condition of matrix multiplication is the coloumn of first matrix should be same as the row of second matrix.
    i.e, 5x4 and 4x6 is possible as 4 of 5x4 == 4 of 4x6 but 5x4 and 6x4 can't be possible.
       And the number of multiplication for 5x4 and 4x6 is 5 * 6 * 4 = 120.
 
 For our ecxmaple there are so many ways to multiply i.e,
 --> M1(M2(M3 * M4))
 -->(M1 * M2)(M3 * M4)
 -->M1(M2 * M3)M4 etc.
 And we have to find the minimum ways to get the result.
 
 Lets solve:
 There are 4 matrix, so lets create the table with empty values.
 
            1       2       3       4
 
    1       -       -       -       -
 
    2       -       -       -       -
 
    3       -       -       -       -
 
    4       -       -       -       -
 
Step 1:
 
    M1 = M[1, 1] = 0, because it's not moltiplied with anyone so cost of multiplication is 0.
    And same for
    M2 = M[2, 2] = 0
    M3 = M[3, 3] = 0
    M4 = M[4, 4] = 0
 
 And the tbale will be:
 
            1       2       3       4
         [1, 1]
    1       0       -       -       -
                  [2, 2]
    2       -       0       -       -
                         [3, 3]
    3       -       -       0       -
                                  [4, 4]
    4       -       -       -       0
 
 
Step 2:
 
    M1 * M2 = M[1, 2] = [5x4] * [4x6] = 5 * 4 * 6 = 120
 
 And the tbale will be:
 
            1       2       3       4
 
         [1, 1]   [1, 2]
    1       0      120       -       -
 
                  [2, 2]
    2       -       0       -       -
 
                         [3, 3]
    3       -       -       0       -
 
                                  [4, 4]
    4       -       -       -       0
 
 
Step 3:
 
    M2 * M3 = M[2, 3] = [4x6] * [6x2] = 4 * 6 * 2 = 48
 
 And the tbale will be:
 
            1       2       3       4
 
         [1, 1]   [1, 2]
    1       0      120       -       -
 
                  [2, 2]  [2, 3]
    2       -       0       48       -
 
                         [3, 3]
    3       -       -       0       -
 
                                  [4, 4]
    4       -       -       -       0
 
 
Step 4:
 
    M3 * M4 = M[3, 4] = [6x2] * [2x7] = 6 * 2 * 7 = 84
 
 And the tbale will be:
 
            1       2       3       4
 
         [1, 1]   [1, 2]
    1       0      120       -       -
 
                  [2, 2]  [2, 3]
    2       -       0       48       -
 
                         [3, 3]   [3, 4]
    3       -       -       0       84
 
                                  [4, 4]
    4       -       -       -       0
 
 
Step 4:
 
    M[1, 3] = M1 * M2 * M3
 Here there are multiple ways to solve and we need to find out the minimum ways to multiply to get result. Lets resolve it.
 
        M1 * (M2 * M3)                            (M1 * M2) * M3
      5x4 * (4x6 * 6x2)                         (5x4 * 4x6) * 6x2
 M[1, 1] + M[2, 3] + (5 * (4 * 2))          M[1, 2] + M[2, 2] + ((5 * 6) * 2)
        0 + 48 + 40                                120 + 0 + 60
            88                                      180
 
 So here we got two values and we have to choose minimum one and i.e, 88
 
 
 And the tbale will be:
 
            1       2       3       4
 
    1       0      120     88       -
 
    2       -       0      48       -
 
    3       -       -      0       84

    4       -       -      -       0
 
 
Step 5:
 
    M[2, 4] = M2 * M3 * M4
 Here also same as previous. Lets resolve it.
 
        M2 * (M3 * M4)                            (M2 * M3) * M4
      4x6 * (6x2 * 2x7)                         (4x6 * 6x2) * 2x7
 M[2, 2] + M[3, 4] + (4 * (6 * 7))          M[2, 3] + M[4, 4] + ((4 * 2) * 7)
        0 + 84 + 168                              48 + 0 + 56
            252                                      104
 
 So we have to choose minimum one and i.e, 104
 
 
 And the tbale will be:
 
            1       2       3       4
 
    1       0      120     88       -
 
    2       -       0      48      104
 
    3       -       -      0       84

    4       -       -      -       0
 
 
Step 6:
 
    M[1, 4] = M1 * M2 * M3 * M4
 Here also same as previous. Lets resolve it.

        M1 * (M2 * M3 * M4)                     (M1 * M2) * (M3 * M4)                            (M1 * M2 * M3) * M4
        M1 *    M[2, 4]                          M[1, 2]  *  M[3, 4]                                M[1, 3]     * M4
      5x4 * (4x6 * 6x2 * 2x7)                 (5x4 * 4x6) * (6x2 * 2x7)                        (5x4 * 4x6 * 6x2) * 2x7
 M[1, 1] + M[2, 4] + (5 * (4 * 7))          M[1, 2] + M[3, 4] + (5 * 6 * 7)                 M[1, 3] + M[4, 4] + ((5 * 2) * 7)
        0 + 104 + 140                              120 + 84 + 210                                   88 + 0 +70
            244                                      414                                                158
 
 So we have to choose minimum one and i.e, 158
 
 
 And the tbale will be:
 
            1       2       3       4
 
    1       0      120     88       158
 
    2       -       0      48      104
 
    3       -       -      0       84

    4       -       -      -       0
 
 Now the final answer is 158.
 
Formula:
 
 Now convert the matrix dimensions(row and coloumn) into array.
 5x4, 4x6, 6x2, 2x7 = [5, 4, 6, 2, 7]
 
 The solution we get from Step 6 and that is
 
 M[1, 4] = min { M[1, 1] + M[2, 4] + (5 * (4 * 7)) , M[1, 2] + M[3, 4] + (5 * 6 * 7) , M[1, 3] + M[4, 4] + ((5 * 2) * 7)}
  
So lets take
 arr = [5, 4, 6, 2, 7]
        0  1  2  3  4
            l = length of array = 5
            i = 1
            j = l - 1 = 4
            k = i to < j
Then the formula is
                M[1, 1] +  M[2, 4]   + (  5       *    4   *   7  )
M[i, j] = min { M[i, k] + M [k+1, j] + (arr[i -1] * arr[k] * arr[j]}
 
 
Time complexity :
 As we are forming matrix so it n^2 but here as we are forming half of the matrix still it's
        n * (n - 1) / 2 = n^2
 And after calculation we are finding the minimum so at most n time
 
 So the final time complexity is n^3.
*/


//Matrix

func matrixChainOrderMatrix(arr: [Int], n: Int) -> Int {
    var T = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    var temp = 0
    
    for l in 2...n {
        for i in 0...n-l {
            
            let j = l + i
            T[i][j] = Int.max
            
            for k in i+1...j {
                
                temp = T[i][k] + T[k][j] + arr[i] * arr[k] * arr[j]
                if(temp < T[i][j]) {
                    T[i][j] = temp
                }
            }
        }
    }
    return T[0][n]
}

let arr1 = [5, 4, 6, 2, 7]
let l1 = 5 //sizeof(arr)/sizeof(arr[0])
let output1 = matrixChainOrderMatrix(arr: arr1, n: l1-1)
print("Output : ", output1)


// Recursive

func matrixChainOrderRecursive(arr: [Int], i: Int, j: Int) -> Int {
    var count = 0
    var result: Int = .max
    if i == j {
        return 0
    }
    
    for k in i...j-1 {
        count = matrixChainOrderRecursive(arr: arr, i: i, j: k) + matrixChainOrderRecursive(arr: arr, i: k+1, j: j) + (arr[i - 1] * arr[k] * arr[j])
        if result > count {
            result = count
        }
    }
    
    return result
}

let arr2 = [5, 4, 6] // for bigger number Playground crash, so takes only upto length 3.
let l2 = 3 //sizeof(arr)/sizeof(arr[0])
let output2 = matrixChainOrderRecursive(arr: arr2, i: 1, j: l2-1)
print("Output : ", output2)

/*
 [5, 4] [4, 6]
            1           2
 
    1       0           120
 
    2       0           0

*/


