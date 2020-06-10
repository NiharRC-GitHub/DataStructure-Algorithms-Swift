/*
Created by nihar chadhei
 
 
    * Given n number of coins and a sum value. Find out minimum number of coins need to get the sum value.
 
    Ex: coins = [2, 1, 3]
        sum = 4
 
    Solution:
        Let's take two different array. One is for computation and another for Storing index to get coins value
 
        comp = [0, Int_Max, Int_Max, Int_Max, Int_Max]
        res = [-1, -1, -1, -1, -1]
 
        i = 1 <= sum
        j = 0 < coins.length
 
        comp:
                0       1       2       3       4
                
                0  Int_Max  Int_Max Int_Max  Int_Max
 
        For 0th position I took 0 value as we know that for 0 value no need of any coins. For rest, it depends upon the coins available. That we will have to find.
 
        res:
                0       1       2       3       4
        
                -1     -1      -1      -1      -1
 
 
Step 1:
    j = 0
    coins = [2, 1, 3]
    i = 1
 
        ccoins[j] <= i = 2 <= 1 = false. So can't do any change and the value will be remains same.
        
                   comp:
                               0       1       2       3       4
                   
                               0  Int_Max  Int_Max Int_Max  Int_Max
        
                   res:
                           0       1       2       3       4
                   
                           -1     -1      -1      -1      -1
 
    i = 2
 
        coins[j] <= i = 2 <= 2 = true.
        
        So the formula here to calculate is

            let val = min { comp[i], 1 + comp[i - coins[j] }
                    = min { comp[2], 1 + comp[2 - coins[0] }
                    = min { Int_Max, 1 + comp[2 - 2] }
                    = min { Int_Max, 1 + comp[0] }
                    = min { Int_Max, 1 + 0}
                    = min { Int_Max, 1}
                    = 1
            if val < comp[i] {
                comp[i] = val
                res[i] = j
            }
            val < comp[i] = 1 < Int_Max = true, comp[i] = val = comp[2] = 1, res[i] = j = res[2] = 0.
                   comp:
                               0       1       2       3       4
                   
                               0  Int_Max      1    Int_Max  Int_Max
        
                   res:
                           0       1       2       3       4
                   
                           -1     -1       0      -1      -1
 
    i = 3
 
        coins[j] <= i = 2 <= 3 = true.

            let val = min { comp[i], 1 + comp[i - coins[j] }
                    = min { comp[3], 1 + comp[3 - coins[0] }
                    = min { Int_Max, 1 + comp[3 - 2] }
                    = min { Int_Max, 1 + comp[1] }
                    = min { Int_Max, 1 + Int_Max}
                    = min { Int_Max, Int_Max}
                    = Int_Max
 
            if val < comp[i] {
                comp[i] = val
                res[i] = j
            }
            val < comp[i] = Int_Max < Int_Max = false, so no change in arrays
        
                   comp:
                               0       1       2       3       4
                   
                               0  Int_Max      1    Int_Max  Int_Max
        
                   res:
                           0       1       2       3       4
                   
                           -1     -1       0      -1      -1
 
 
    i = 4
 
        coins[j] <= i = 2 <= 4 = true.

            let val = min { comp[i], 1 + comp[i - coins[j] }
                    = min { comp[4], 1 + comp[4 - coins[0] }
                    = min { Int_Max, 1 + comp[4 - 2] }
                    = min { Int_Max, 1 + comp[2] }
                    = min { Int_Max, 1 + 1}
                    = min { Int_Max, 2}
                    = 2
            if val < comp[i] {
                comp[i] = val
                res[i] = j
            }
            val < comp[i] = 2 < Int_Max = true, comp[i] = val = comp[4] = 2, res[i] = j = res[4] = 0.
                   comp:
                               0       1       2       3       4
                   
                               0   Int_Max      1    Int_Max   2
        
                   res:
                           0       1       2       3       4
                   
                           -1     -1       0      -1      0
 
 Step 2:
    j = 1
    coins = [2, 1, 3]
    i = 1
 
        coins[j] <= i = 1 <= 1 = true.

            let val = min { comp[i], 1 + comp[i - coins[j] }
                    = min { comp[1], 1 + comp[1 - coins[1] }
                    = min { Int_Max, 1 + comp[1 - 1] }
                    = min { Int_Max, 1 + comp[0] }
                    = min { Int_Max, 1 + 0}
                    = min { Int_Max, 1}
                    = 1
            if val < comp[i] {
                comp[i] = val
                res[i] = j
            }
            val < comp[i] = 1 < Int_Max = true, comp[i] = val = comp[1] = 1, res[i] = j = res[1] = 1.
                   comp:
                               0       1       2       3       4
                   
                               0       1      1    Int_Max     2
        
                   res:
                           0       1       2       3       4
                   
                           -1      1       0      -1       0
    i = 2
 
        coins[j] <= i = 1 <= 2 = true.

            let val = min { comp[i], 1 + comp[i - coins[j] }
                    = min { comp[2], 1 + comp[2 - coins[1] }
                    = min { 1, 1 + comp[2 - 1] }
                    = min { 1, 1 + comp[1] }
                    = min { 1, 1 + 1}
                    = min { 1, 2}
                    = 1
            if val < comp[i] {
                comp[i] = val
                res[i] = j
            }
            val < comp[i] = 1 < 1 = false, so no change.
                   comp:
                               0       1       2       3       4
                   
                               0       1       1    Int_Max    2
        
                   res:
                           0       1       2       3       4
                   
                           -1      1       0      -1       0
 
    i = 3
    
           coins[j] <= i = 1 <= 3 = true.

               let val = min { comp[i], 1 + comp[i - coins[j] }
                       = min { comp[3], 1 + comp[3 - coins[1] }
                       = min { Int_Max, 1 + comp[3 - 1] }
                       = min { Int_Max, 1 + comp[2] }
                       = min { Int_Max, 1 + 1}
                       = min { Int_Max, 2}
                       = 2
               if val < comp[i] {
                   comp[i] = val
                   res[i] = j
               }
               val < comp[i] = 2 < Int_Max = true, comp[i] = val = comp[3] = 2, res[i] = j = res[3] = 1.
                      comp:
                                  0       1       2       3       4
                      
                                  0       1       1       2       2
           
                      res:
                              0       1       2       3       4
                      
                              -1      1       0       1       0
 
 
    i = 4
    
           coins[j] <= i = 1 <= 4 = true.

               let val = min { comp[i], 1 + comp[i - coins[j] }
                       = min { comp[4], 1 + comp[4 - coins[1] }
                       = min { 2, 1 + comp[4 - 1] }
                       = min { 2, 1 + comp[3] }
                       = min { 2, 1 + 2}
                       = min { 2, 3}
                       = 3
               if val < comp[i] {
                   comp[i] = val
                   res[i] = j
               }
               val < comp[i] = 3 < 2 = false, so no change.
                      comp:
                                  0       1       2       3       4
                      
                                  0       1       1       2       2
           
                      res:
                              0       1       2       3       4
                      
                             -1       1       0       1       0
 
 Step 3:
    j = 2
    coins = [2, 1, 3]
 
    i = 1
    
           coins[j] <= i = 3 <= 1 = false. So no change.

                      comp:
                                  0       1       2       3       4
                      
                                  0       1       1       2       2
           
                      res:
                              0       1       2       3       4
                      
                             -1       1       0       1       0
 
    i = 2
 
        coins[j] <= i = 3 <= 2 = false. So no change.

                   comp:
                               0       1       2       3       4
                   
                               0       1       1       2       2
        
                   res:
                           0       1       2       3       4
                   
                          -1       1       0       1       0
        
 
    i = 3
 
        coins[j] <= i = 3 <= 3 = true.

            let val = min { comp[i], 1 + comp[i - coins[j] }
                    = min { comp[3], 1 + comp[3 - coins[1] }
                    = min { 2, 1 + comp[3 - 3] }
                    = min { 2, 1 + comp[0] }
                    = min { 2, 1 + 0}
                    = min { 2, 1}
                    = 1
            if val < comp[i] {
                comp[i] = val
                res[i] = j
            }
            
            val < comp[i] = 1 < 2 = true, comp[i] = val = comp[3] = 1, res[i] = j = res[3] = 2.
                   comp:
                               0       1       2       3       4
                   
                               0       1       1       1       2
        
                   res:
                           0       1       2       3       4
                   
                          -1       1       0       2       0
        
    i = 4
    
           coins[j] <= i = 3 <= 4 = true.

               let val = min { comp[i], 1 + comp[i - coins[j] }
                       = min { comp[4], 1 + comp[4 - coins[1] }
                       = min { 2, 1 + comp[4 - 3] }
                       = min { 2, 1 + comp[1] }
                       = min { 2, 1 + 1}
                       = min { 2, 2}
                       = 2
               if val < comp[i] {
                   comp[i] = val
                   res[i] = j
               }
               
               val < comp[i] = 2 < 2 = false, so no change.
                      comp:
                                  0       1       2       3       4
                      
                                  0       1       1       2       2
           
                      res:
                              0       1       2       3       4
                      
                             -1       1       0       2       0
 
 
    Result:
        Total number of coins need = comp[sum] = comp[4] = 2
        Coins are :
            let l = res.length - 1
            if res[l] == -1 {
                Print("No solutions")
            }
            
            while(l) {
                let coinIndex = res[l]
                let coin = coins[coinIndex]
                Print("coin")
                l = l - coin
            }
        i.e, 2, 2
*/

func minimumCoinsRequires(coins: [Int], total: Int) {
    var comp = Array(repeating: Int.max-1, count: total+1)
    var res = Array(repeating: -1, count: total+1)
    comp[0] = 0
    
    for j in 0...coins.count-1 {
        for i in 1...total {
            if(i >= coins[j]){
                if (comp[i - coins[j]] + 1 < comp[i]) {
                    comp[i] = 1 + comp[i - coins[j]]
                    res[i] = j
                }
            }
        }
    }
    
    var l = res.count - 1
    if res[l] == -1 {
        print("No solutions")
        return
    }
    
    print("Minimum number of coins Required : ", comp[total])
    print("Coins are : ")
    
    while(l > 0) {
        let coinIndex = res[l]
        let coin = coins[coinIndex]
        print(coin)
        l = l - coin
    }
}

let coins = [2, 1, 3]
let sum = 4
minimumCoinsRequires(coins: coins, total: sum)

minimumCoinsRequires(coins: [2, 1, 3, 5, 4], total: 16)
