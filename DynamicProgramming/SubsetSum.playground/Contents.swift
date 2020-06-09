/*
Created by nihar chadhei
 
Subset Sum Problem. Find whether the sum value is present in given array.
 
 Ex: arr = [2, 4, 3, 2, 1], sum = 7
 
 We can resolve this in two way, (i) Backtracking using tree and recursion and (ii) Using Matrix lookup table
 
 Backtracking:
    Let's form the tree. Either we consider the value or not.
 
                                                (0, 7)
                                                 / \
    let n = 0
 
    i. arr[0] = 2, (arr[0] + n) < 7 = (0 + 2) < 7 = 2 <= 7 = true. so we can add this to tree node
                                                    
                                                     (0, 7)
                                                    /
                                                  (2)  = (0 + 2, 7) = (2, 7)
                                                  /
        Now n = n + arr[0] = 0 + 2 = 2
        n != sum, So Continue
 
    ii. arr[1] = 4, (arr[1] + n) < 7 = (2 + 4) < 7 = 6 <= 7 = true, so we can add this to tree node.
                                                      (0, 7)
                                                     /
                                                    2 = (2, 7)
                                                  /
                                                4 = (4 + 2, 7) = (6, 7)
        Now n = n + arr[1] = 2 + 4 = 6
        n != sum, So Continue
 
    iii. arr[2] =  (arr[2] + n) < 7 = (3 + 6) < 7 =  9 <= 7 = false, so we can't add this to tree node.

                                                     (0, 7)
                                                     /
                                                    2 = (2, 7)
                                                  /
                                                4 = (6, 7)
                                              /
                                            3 = (6 + 3, 7) = (9, 7), Not possible as 9 <= 7 = false
        This can't  possible and tree will be
                                    
                                        (0, 7)
                                        /
                                    2 = (2, 7)
                                    /
                                4 = (6, 7)
 
    iv. arr[3] =  (arr[3] + n) < 7 = (2 + 6) < 7 = 8 <= 7 = = false, so we can't add this to tree node.
                                         (0, 7)
                                        /
                                       2 = (2, 7)
                                     /
                                   4 = (6, 7)
                                    \
                                    2 = (6 + 2, 7) = (8, 7), Not possible as 9 <= 7 = false
 
        This can't  possible and tree will be
                             
                                        (0, 7)
                                         /
                                     2 = (2, 7)
                                     /
                                 4 = (6, 7)
 
    v. Now including a[1], Not possible. So need to skip this value. And the tree will be
                                                (0, 7)
                                                /
                                            2 = (2, 7)
         Now n = n + arr[0] = 0 + 2 = 2
        n != sum, So Continue
 
    Vi. arr[2] =  (arr[2] + n) < 7 = (3 + 2) < 7 = 5 <= 7 = true, so we can add this to tree node.
 
                                          (0, 7)
                                          /
                                    2 = (2, 7)
                                        /  \
                                            3  = ((3 + 2), 7) = (5, 7) = 5 <= 7 = true
        Now n = n + arr[0] = 2 + 3 = 5
        n != sum, So Continue
 
    Vi. arr[3] =  (arr[3] + n) < 7 = (2 + 5) < 7 = 7 <= 7 = true, so we can add this to tree node.
    
                                            (0, 7)
                                             /
                                       2 = (2, 7)
                                           /  \
                                               3  = ((3 + 2), 7) = (5, 7) = 5 <= 7 = true
                                                \
                                                 2 = ((2 + 5), 7) = (7, t) = 7 <= 7 = true
    n == sum, So we found the value. Thats the value.

*/

func subsetSum(arr: [Int], rArray: [Int], arrSize: Int, rArrSize: Int, sum: Int, i: Int, targetSum: Int) {
    
    var resultArray = rArray
    if targetSum == sum {
        print("Found Result: ", resultArray)
        return
    } else {
        if i < arrSize {
            if sum + arr[i] <= targetSum {
                for j in i...arrSize-1 {
                    resultArray[rArrSize] = arr[j]
                    if( sum + arr[j] <= targetSum) {
                        let newSum = sum + arr[j]
                        subsetSum(arr: arr, rArray: resultArray, arrSize: arrSize, rArrSize: rArrSize + 1, sum: newSum, i: (j + 1), targetSum: targetSum)
                    }
                }
            } else {
                subsetSum(arr: arr, rArray: resultArray, arrSize: arrSize, rArrSize: rArrSize, sum: sum, i: i + 1, targetSum: targetSum)
            }
        }
    }
}

let arr = [2, 4, 3, 2, 1]
let sum = 5
let size = 5
var T = Array(repeating: 0, count: size)
subsetSum(arr: arr, rArray: T, arrSize: size , rArrSize: 0, sum: 0, i: 0, targetSum: sum)
/*
 Found Result:  [2, 3, 0, 0, 0]
 Found Result:  [2, 2, 1, 0, 0]
 Found Result:  [4, 1, 0, 0, 0]
 Found Result:  [3, 2, 0, 0, 0]
 */


/*
    Matrix:
        Here we have to either pick the value or not. If we pick the value, then will fill the perticular position in table with True, otherwise false.
 
    arr = [2, 4, 3, 2, 1]
    sum = 5
    
   Tbale:
        row = i
        coloumn = j
                0       1       2       3       4       5
 
        0       -       -       -       -       -       -
    
        2       -       -       -       -       -       -
 
        4       -       -       -       -       -       -
 
        3       -       -       -       -       -       -
 
        2       -       -       -       -       -       -
 
        1       -       -       -       -       -       -
 
    --> Row presents arr value including first row 0 for default value calculation
    --> Coloumn presents the value we looking for. Same start from 0 <= sum.
 
    
     Step 1:
        i = 0
                       0       1       2       3       4       5
        
               0       T       F       F       F       F       F
           
               2       -       -       -       -       -       -
        
               4       -       -       -       -       -       -
        
               3       -       -       -       -       -       -
        
               2       -       -       -       -       -       -
        
               1       -       -       -       -       -       -
 
        --> T[0][0] = True. Because we can get 0 by including 0 from Row. And rest of the we can't get including 0.
 
 
    Step 2:
        i = 1
                       0       1       2       3       4       5
        
               0       T       F       F       F       F       F
           
               2       T       F       T       F       F       F
        
               4       -       -       -       -       -       -
        
               3       -       -       -       -       -       -
        
               2       -       -       -       -       -       -
        
               1       -       -       -       -       -       -
 
        --> T[1][0] = T. Because 2 > 0, So simply the top row same coloumn value will assign. i.e, T[1][0] = T[0][0] = True
        --> T[1][1] = F. Because 2 > 1. Same as above.  T[1][1] = T[0][1] = False.
 
        --> Now T[1][2] <= 2 = 2 <= 2. So in this case,
                * If the top row same coloumn value is true, then simply pick that value and assign.
                  -> Otherwise substract the  row value from coloumn value, i.e, v = 2 - 2 = 0
                  -> Then go to the top row with v column and pick that value. i.e, T[i-1][v].
                  -> No check if the top row same coloumn value T[i-1][j] or T[i-1][v] is true then assign value true or else false.
                  -> So here T[i-1][j] || T[i-1][v] = T[0][2] || T[0][0] = false || true = true
 
        --> Same will for rest of the Row and coloumn.
 
    -> Now lets fill the table quickly
 
                0       1       2       3       4       5
 
        0       T       F       F       F       F       F
    
        2       T       F       T       F       F       F
 
        4       T       F       T       F       T       F
 
        3       T       F       T       T       T       T
 
        2       T       F       T       T       T       T
 
        1       T       T       T       T       T       T
 
 So result will be T[size][sum].
 */

func subset_sum(input: [Int], targetSum: Int, size: Int) -> Bool {
    var T = Array(repeating: Array(repeating: false, count: size+1), count: targetSum+1)
    
    for i in 0...size {
        T[i][0] = true
    }
    
    for i in 1...size {
        for j in i...targetSum {
            if (j - input[i - 1] >= 0) {
                T[i][j] = T[i - 1][j] || T[i - 1][j - input[i - 1]]
            } else {
                T[i][j] = T[i-1][j]
            }
        }
    }
    return T[size][targetSum]
}

let arr1 = [2, 4, 3, 2, 1]
let sum1 = 5
let size1 = 5
let result = subset_sum(input: arr1, targetSum: sum1, size: size1)
print(result) //True

