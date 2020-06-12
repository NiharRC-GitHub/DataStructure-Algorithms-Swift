/*
Created by nihar chadhei

Knapsack Proble Dynamic Programming
Q1.     Let weight elements = [1, 3, 5]
        Let weight values = [10, 15, 40]
        Capacity = 5
 
 Solution:
 
                0       1       2       3       4       5
 val    wt

 10     1       0       10      10      10      10      10
 
 15     3       0       10      10      15      25      25
 
 40     5       0       10      10      15      25      40
 
 
 
 Description:
 
 Row 1 :
 
                0       1       2       3       4       5
 val    wt

 10     1       0       10      10      10      10      10
 
 
 Value 0 :
 we have 0 weight in 1st coloumn and item 1 is having wt 1. Hence can't choose the value 10 so we consider 0.
 
 Value 10:
 we have 1 weight in 2nd coloumn and item 1 is having wt 1. Hence we can choose the value 10 and rest column in the row will same value as weight is less in  comparision.
 
  Row 2 :
                0       1       2       3       4       5
 val    wt

 10     1       0       10      10      10      10      10
 
 15     3       0       10      10      15      25      25
 
 Value 0 :
 we have 0 weight in 1st coloumn and item 1 is having wt 1. Hence in this situation we can just pick the row same column value i.e 0. And same for coloumn 2 and 3, as the item weight we have 3. So the value will be 10, 10. So, here the condition and calculation is
 
 i = row
 w = coloumn
    if w < wt[i] {
    K[i][w] = K[i-1][w]
 
 value 15:
 Here our item weight and coloumn 4 has same weight. So either we can choose the top row same coloumn value i.e, 10 or we can choose the current item value 15 + Matrix[coloumn wt(3) - item weight (3)], i.e Matrix[0] = 0
 So we will choose max(10 , (15 + 0)) = 15
 
 i = row
 w = coloumn
    if w >= wt[i] {
    K[i][w] =max(val[i] + K[i-1][w-wt[i]],  K[i-1][w])
 
 And so on the matrix will form.
 
 
Q2.     Let weight elements = [10, 20, 30]
        Let weight values = [1, 1, 1]
        Capacity = 2
 
 Solution:
 
                0       1       2
 val    wt

 10     1       0       10      10
 
 20     1       0       20      30
 
 30     1       0       30      50
 
 
Q3.     Let weight elements = [10, 20, 30]
        Let weight values = [1, 1, 2]
        Capacity = 2
 
 Solution:
 
                0       1       2
 val    wt

 10     1       0       10      10
 
 20     1       0       20      30
 
 30     2       0       30      30
 
*/


func findKanpsack(totalWeight W: Int, weight wt: [Int], values val: [Int], size n: Int) -> Int {
    let arrSize = n > W ? n : W
    var K = Array(repeating: Array(repeating: 0, count: arrSize+1), count: arrSize+1)
    
    for i in 0...n {
        for w in 0...W {
            if (i == 0 || w == 0) {
                K[i][w] = 0
            } else if w < wt[i-1] {
                K[i][w] = K[i-1][w]
            } else {
                K[i][w] = max(val[i-1] + K[i-1][w-wt[i-1]],  K[i-1][w])
            }
        }
    }
    return K[n][W]
}

let val = [10, 20, 30]
let wt = [1, 1, 1]
let W = 2
let n = 3 //sizeof(val)/sizeof(val[0])
let output = findKanpsack(totalWeight: W, weight: wt, values: val, size: n)

print("Output: ", output)

/*
 Output:  50
 */


let val1 = [10, 15, 40]
let wt1 = [1, 3, 5]
let W1 = 5
let n1 = 3 //sizeof(val)/sizeof(val[0])
let output1 = findKanpsack(totalWeight: W1, weight: wt1, values: val1, size: n1)

print("Output: ", output1)

/*
Output:  40
*/
