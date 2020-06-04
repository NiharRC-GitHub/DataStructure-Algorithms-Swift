/*
Created by nihar chadhei

Knapsack Proble Dynamic Programming
        Let weight elements = {1, 3, 5}
        Let weight values = {10, 15, 40}
        Capacity = 5
 
 Solution:
 
                0       1       2       3       4       5
 val    wt

 10     1       0       10      10      10      10      10
 
 15     3       0       10      10      15      25      25
 
 40     5       0       10      10      15      25      40
 
 
 
 
        Let weight elements = {10, 20, 30}
        Let weight values = {1, 1, 1}
        Capacity = 2
 
 Solution:
 
                0       1       2
 val    wt

 10     1       0       10      10
 
 20     1       0       20      30
 
 30     1       0       30      10
 
 
        Let weight elements = {10, 20, 30}
        Let weight values = {1, 1, 1}
        Capacity = 2
 
 Solution:
 
                0       1       2
 val    wt

 10     1       0       10      10
 
 20     1       0       20      30
 
 30     2       0       30      30
 
*/


func findKanpsack(totalWeight W: Int, weight wt: [Int], values val: [Int], size n: Int) -> Int {
    var K = Array(repeating: Array(repeating: 0, count: n+1), count: W+2)
    
/*
    This is the formula, but for bigger calculation may be playground through error in case of arry operation.
    Here the first example is not able to run but other two will run succecfully
    Let weight elements = {1, 3, 5}
    Let weight values = {10, 15, 40}
    Capacity = 5
*/
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
    print(K)
    return K[n-1][W]
}

let val = [10, 20, 30]
let wt = [1, 1, 2]
let W = 2;
let n = 3 //sizeof(val)/sizeof(val[0])
let output = findKanpsack(totalWeight: W, weight: wt, values: val, size: n)

print("Output: ", output)
