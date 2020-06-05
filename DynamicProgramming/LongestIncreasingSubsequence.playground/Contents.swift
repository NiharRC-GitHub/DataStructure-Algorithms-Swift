/*
Created by nihar chadhei
 
 Longest Increasing Subsequence.
 
 Ex: [11, 20, 10, 33, 19, 48, 37, 55, 70]
 
 Increasing subsequences are :
 [11, 20, 33, 48, 55, 70]
 [11, 20, 33, 37, 55, 70]
 [11, 19, 48, 55, 70]
 [11, 19, 37, 55, 70]
 [20, 33, 48, 55, 70]
 [20, 33, 37, 55, 70]
 [10, 33, 48, 55, 70]
 [10, 33, 37, 55, 70]
 [10, 19, 48, 55, 70]
 [10, 19, 37, 55, 70]
 
 and so on...
 
 Solution:
 
 Input a = [11, 20, 10, 33, 22]
 
 Result Array r = [1, 1, 1, 1, 1] // Initialised with 1 as we consider max increasing subsequence is 1
 
 Now we need two loop:
 1. i will 1 to end
 2. j will be 0 < i
 
 
################# Step 1 : i = 1, j = 0, j < i, a[i] = 20 #################
 
--> j = 0 and i = 1, (0 < 1) = true. a[i] > a[j] = 20 > 11 = true. So r[i] <  r[j] + 1 = 1 < (1 + 1) = true. So r[i] =  r[j] + 1 = 2
    Results r = [1, 2, 1, 1, 1]
--> j = 1 and i = 1, (1 < 1) = false. No change.
    Results r = [1, 2, 1, 1, 1]
 
################# Step 2: i = 2, j = 0, j < i, a[i] = 10 #################

--> j = 0 and i = 2, (0 < 2) = true. a[i] > a[j] = 10 > 11 = false. no change.
    Results r = [1, 2, 1, 1, 1]
 
--> j = 1 and i = 2, (1 < 2) = true. a[i] > a[j] = 10 > 20 = false. no change.
    Results r = [1, 2, 1, 1, 1]
 
--> j = 2 and i = 2, (2 < 2) = false. No change.
    Results r = [1, 2, 1, 1, 1]
 
################# Step 3: i = 3, j = 0, j < i, a[i] = 33 #################
 
--> j = 0 and i = 3, (0 < 3) = true. a[i] > a[j] = 33 > 11 = true. So r[i] <  r[j] + 1 = 1 < (1 + 1) = true. So r[i] =  r[j] + 1 = 2
    Results r = [1, 2, 1, 2, 1]

--> j = 1 and i = 3, (1 < 3) = true. a[i] > a[j] = 33 > 20 = true. So r[i] <  r[j] + 1 = 2 < (2 + 1) = true. So r[i] =  r[j] + 1 = 3
    Results r = [1, 2, 1, 3, 1]
 
--> j = 2 and i = 3, (2 < 3) = true. a[i] > a[j] = 33 > 10 = true. So r[i] <  r[j] + 1 = 3 < (1 + 1) = false. So no change.
    Results r = [1, 2, 1, 3, 1]
 
 --> j = 3 and i = 3, (3 < 3) = false. No change.
    Results r = [1, 2, 1, 3, 1]
 
################# Step 4: i = 4, j = 0, j < i, a[i] = 22 #################
  
--> j = 0 and i = 4, (0 < 4) = true. a[i] > a[j] = 22 > 11 = true. So r[i] <  r[j] + 1 = 1 < (1 + 1) = true. So r[i] =  r[j] + 1 = 2
    Results r = [1, 2, 1, 3, 2]

--> j = 1 and i = 4, (1 < 4) = true. a[i] > a[j] = 22 > 20 = true. So r[i] <  r[j] + 1 = 2 < (2 + 1) = true. So r[i] =  r[j] + 1 = 3
    Results r = [1, 2, 1, 3, 3]
 
--> j = 2 and i = 4, (2 < 4) = true. a[i] > a[j] = 22 > 10 = true. So r[i] <  r[j] + 1 = 3 < (1 + 1) = false. So no change.
    Results r = [1, 2, 1, 3, 3]
 
--> j = 3 and i = 4, (3 < 4) = true. a[i] > a[j] = 22 > 33 = false. So no change.
    Results r = [1, 2, 1, 3, 3]
 
--> j = 4 and i = 4, (4 < 4) = false. No change.
    Results r = [1, 2, 1, 3, 3]
 
 
 So Answer is 3.
 
 */

func lengthOfLSC(arr: [Int], arrLenght: Int) -> Int {
    var length = 1
    var T = Array(repeating: 1, count: arrLenght+1)
    
    for i in 1...arrLenght {
        for j in 0...i {
            if arr[i] > arr[j], T[i] < T[j] + 1 {
                
                let increasingLength = T[j] + 1
                T[i] =  increasingLength
                
                if length < increasingLength {
                    length = increasingLength
                }
            }
        }
    }
    return length
}

let ex1 = [11, 20, 10, 33, 22]
let l1 = 4 //sizeof(ex1)/sizeof(ex1[0])
let output1 = lengthOfLSC(arr: ex1, arrLenght: l1)
print(output1)

let ex2 = [11, 20, 10, 33, 19, 48, 37, 55, 70]
let l2 = 8 //sizeof(ex2)/sizeof(ex2[0])
let output2 = lengthOfLSC(arr: ex2, arrLenght: l2)
print(output2)
