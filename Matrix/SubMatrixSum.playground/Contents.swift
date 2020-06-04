/*
Created by nihar chadhei

Calculate sum of elements in a sub-matrix in constant time
                        {
                           { 6, 2, 5, 8, 3 },
                           { 4, 9, 2, 3, 5 },
                           { 6, 8, 4, 1, 2 },
                           { 7, 2, 1, 5, 3 },
                           { 1, 3, 8, 9, 6 }
                       }
 
 p = 1, q = 1, r = 3, s = 3
 
 sum = 9 + 2 + 3
    + 8 + 4 + 1
    + 2 + 1 + 5
 
    = 35
 
*/

func findSubMatrixSum(mat: [[Int]], p: Int, q: Int, r: Int, s:Int) -> Int {
    let m = 4
    let n = 4
    var sum = Array(repeating: Array(repeating: 0, count: 5), count: 5)
    sum[0][0] = mat[0][0]
    
    //pre-process first row
    for j in 1...n {
        sum[0][j] = mat[0][j] + mat[0][j-1]
    }
    
    //pre-process first coloumn
    for i in 1...m {
        sum[i][0] = mat[i][0] + mat[i-1][0]
    }
    
    //pre-process rest of the matrix
    for i in 1...m {
        for j in 1...n {
            sum[i][j] = mat[i][j] + sum[i - 1][j] + sum[i][j - 1]
            - sum[i - 1][j - 1]
        }
    }
    /*
     sum = [
            [6,  8,  7,  13, 11],
            [10, 21, 22, 31, 34],
            [10, 29, 34, 44, 49],
            [13, 34, 40, 55, 63],
            [8,  32, 46, 70, 84]
        ]
     */
    // total = sum[r][s] - sum[r][q-1] - sum[p-1][s] + sum[p-1][q-1]
    var total = sum[r][s]

    if (q - 1 >= 0) {
        total -= sum[r][q - 1]// 55 -= 13
    }
    if (p - 1 >= 0) {
        total -= sum[p - 1][s] // 42 -= 13
    }
    if (p - 1 >= 0 && q - 1 >= 0) {
        total += sum[p - 1][q - 1] // 29 += 6
    }
    return total
}

let mat = [
    [ 6, 2, 5, 8, 3 ],
    [ 4, 9, 2, 3, 5 ],
    [ 6, 8, 4, 1, 2 ],
    [ 7, 2, 1, 5, 3 ],
    [ 1, 3, 8, 9, 6 ]
]
let p = 1, q = 1, r = 3, s = 3

let result = findSubMatrixSum(mat: mat, p: p, q: q, r: r, s: s)
print(result)
