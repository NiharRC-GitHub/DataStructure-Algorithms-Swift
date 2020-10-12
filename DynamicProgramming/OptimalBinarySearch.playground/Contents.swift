/*
Created by nihar chadhei
 
 Optimal Binary Search tree.
 
 Binary tree:
    All the large value will be in the right side and small value will be in left side.
    
    Ex: [10, 20 ,30]
 
    Number of binary tree we can form for 3 Keys:
        
        10                10                20              30      30
          \                 \              /  \             /       /
           20                30           10   30         20       10
            \               /                             /         \
            30             20                           10          20
 
    Maximum search to find the value:
 
        1.                2.                3.              4.      5.
 
        10                10                20              30      30
          \                 \              /  \             /       /
           20                30           10   30         20       10
            \               /                             /         \
            30             20                           10          20
        
        (1+2+3) / 3   (1+2+3) / 3     (1+2+2) / 2   (1+2+3) / 3   (1+2+3) / 3
 
        Here, 3rd option is best one to search a value. So less height of tree gives the optimal solution. Depends on the tree formation.
 
        Now all values are not searched in same frequency and let's take the example, which will have frequencies of all value.
 
        EX: [10, 20 ,30]
             3   2   4  <-- Frequencies
 
 
 
                    1.                        2.                      3.                           4.                      5.
        
               10 (3 * 1)               10 (3 * 1)                20 (2 * 1)                   30 (4 * 1)               30 (4 * 1)
                 \                        \                      /  \                          /                       /
                  20 (2 * 2)               30 (4 * 2)           10   30                      20 (2 * 3)              10 (3 * 2)
                   \                       /                (3 * 2)  (4 * 2)                /                          \
                   30 (4 * 3)            20 (2 * 3)                                       10 (3 * 3)                    20 (2 * 2)
 
                  (19 / 3)              (17 / 3)              (16 / 3)                    (19 / 3)                        (14 / 3)
 
        Here, After frequency added to all values, 5th one gave the best solution.
 
    Now lets take the example and solve by DP.
 
    EX: arr = [10, 20, 30, 40]
        frq = [4, 2, 6, 3]
 
    Let's create the table T.
    
    Row i = 0, Coloumn j = 0, l = j - i
        
                                0       1       2       3       4
        val    fre
 
        0       0       0       -       -       -       -       -
 
        10      4       1       -       -       -       -       -
 
        20      2       2       -       -       -       -       -
 
        30      6       3       -       -       -       -       -
 
        40      3       4       -       -       -       -       -
 
    Step 1: l = 0
        l = j - i = 0, (i, j) = (0, 0), (1, 1), (2, 2), (3, 3) , (4, 4)
 
        (j, i) = (0 - 0), (1 - 1), (2 - 2), (3 - 3), (4 - 4). All these represents same node i.e, 0 - 0 i.e, 0.
        
        0 - 0 = 4
        1 - 1 = 2
        2 - 2 = 6
        3 - 3 = 3
                
        And the table will be,
        
                                0       1       2       3       4
        val    fre
 
        0       0       0       0       -       -       -       -
 
        10      4       1       -       0       -       -       -
 
        20      2       2       -       -       0       -       -
 
        30      6       3       -       -       -       0       -
                        
        40      3       4       -       -       -       -       0
 

 
    Step 2: l = 1
        l = j - i = 1, (i, j) = (0, 1), (1, 2), (2, 3), (3, 4)
 
        (j, i) = (0 - 1), (1 - 2), (2 - 3), (3 - 4). All these represents just one key i.e, 0 - 1 is just one key i.e, (0, 4).
        
        0 - 1 = 4
        1 - 2 = 2
        2 - 3 = 6
        3 - 4 = 3
                
        And the table will be,
        
                                0       1       2       3       4
        val    fre
 
        0       0       0       0       4       -       -       -
 
 
        10      4       1       -       0       2       -       -
 
 
        20      2       2       -       -       0       6       -
 
 
        30      6       3       -       -       -       0       3
 
                        
        40      3       4       -       -       -       -       0
 
 
    Step 3: l = 2
        l = j - i = 2, (i, j) = (0, 2), (1, 3), (2, 4)
 
        All these represents 2 keys i.e, 0 - 2 is  (0, 4, 2), Just ignore the 1st i.e, 0 because wwe added the 0 coloumn and row for our convinience and calculation.
        So it's (4, 2) and same applies for other
        
        0 - 2 = (4, 2) = (10, 20)
        1 - 3 = (2, 6) = (20, 30)
        2 - 4 = (6, 3) = (30, 40)

 
        ###################### For 0 - 2 = (0, 4, 2) = (10, 20), As I mentioned just ignore 1st key i.e, 0 so left (4, 2) ###############################
 
                10 (4 * 1)                      20 (2 * 1)
                  \                            /
                   20 (2 * 2)                10 (4 * 2)
 
                  4 + 4 = 8                 2 + 8 = 10
 
        So let's see how this value, we are getting and the formula for this.
    
        Here total width w[0 - 2], by ignoring 1st key i.e [1 - 2] = 4 + 2 = 6
 
        Now
                For root = 1 i.e, 10 :                              For root = 2 i.e, 20 :
 
                10 (4 * 1)                                           20 (2 * 1)
                  \                                                  /
                   20 (2 * 2)                                      10 (4 * 2)
 
                  4 + 4 = 8                                         2 + 8 = 10
 
            T[0, 0] + [1, 2] + w[0 - 2]                            T[0, 1] + T[2, 2] + w[0 - 2]
            
                0   +   2   +   6                                      4    +   0    +    6
 
                        8                                                       10
 
        Let see how are we getting this formula :
 
            Now the range is 0 - 2, means we will get two values and we have to get minimum of it and then add the weight, So the possibilities are:
 
                min { [0 , __] + [__ , 2], [0 , __] + [__ , 2]} + W[0 - 2]
            
            =   min { [0 , 0] + [1 , 2], [0 , 1] + [2 , 2]} + W[0 - 2]
                              |                   |
                            0 to 1               1 to 2
            =   min { 0 + 2 , 4 + 0} + 6
            =   min {2, 4} + 6
            =   2 + 6 = 8
 
 
            min(2, 4) = 2 and found the value when 1 was root node.
 
            And the table will be,
           
                                   0       1       2       3       4
           val    fre
                                                     1
           0       0       0       0       4       8       -       -
    
    
           10      4       1       -       0       2       -       -
    
    
           20      2       2       -       -       0       6       -
    
    
           30      6       3       -       -       -       0       3
    
                           
           40      3       4       -       -       -       -       0
 
 
 
        ###################### For 1 - 3 = (4, 2, 6) = (20, 30), As I mentioned just ignore 1st key i.e, 4 so left (2, 6) ###############################
 
                20 (2 * 1)                      30 (6 * 1)
                  \                            /
                   30 (6 * 2)                20 (2 * 2)
 
                  2 + 12 = 14                6 + 4 = 10
 
            min(14, 10) = 10 and found the value when 3 was root node.
 
        Here total width w[1 - 3],  by ignoring 1st key i.e [2 - 3] = 2 + 6 = 8
 
        Now
                For root = 2 i.e, 20 :                              For root = 3 i.e, 30 :
 
                20                                                    30
                  \                                                  /
                   30                                               20
 
                min { [1 , __] + [__ , 3], [1 , __] + [__ , 3]} + W[1 - 3]
            
            =   min { [1 , 1] + [2 , 3], [1 , 2] + [3 , 3]} + W[1 - 3]
                              |                   |
                            1 to 2              2 to 3
            =   min { 0 + 6 , 2 + 0} + 8
            =   min {6, 2} + 8
            =   2 + 8 = 10
        
            min(6, 2) = 2 and found the value when 3 was root node.
 
        And the table will be,
                  
                                          0       1       2       3       4
                  val    fre
                                                            1
                  0       0       0       0       4       8       -       -
           
                                                                     3
                  10      4       1       -       0       2       10       -
           
           
                  20      2       2       -       -       0       6       -
           
           
                  30      6       3       -       -       -       0       3
           
                                  
                  40      3       4       -       -       -       -       0
        
 
               ###################### For 2 - 4 = (2, 6, 3) = (30, 40), As I mentioned just ignore 1st key i.e, 2 so left (6, 3) ###############################
        
                       30 (6 * 1)                      40 (3 * 1)
                         \                            /
                          40 (3 * 2)                30 (6 * 2)
        
                         6 + 6 = 12                3 + 12 = 15
        
                   min(12, 15) = 12 and found the value when 3 was root node.
        
               Here total width w[2 - 4],  by ignoring 1st key i.e [3 - 4] = 6 + 3 = 9
        
               Now
                       For root = 3 i.e, 30 :                              For root = 4 i.e, 40 :
        
                       30                                                    40
                         \                                                  /
                          40                                               30
        

                min { [2 , __] + [__ , 4], [2 , __] + [__ , 4]} + W[2 - 4]
            
            =   min { [2 , 2] + [3 , 4], [2 , 3] + [4 , 4]} + W[2 - 4]
                              |                   |
                            2 to 3              3 to 4
            =   min { 0 + 3 , 6 + 0} + 9
            =   min {3, 6} + 9
            =   3 + 9 = 12
        
            min(3, 6) = 3 and found the value when 3 was root node.

        
               And the table will be,
                         
                                                 0       1       2       3       4
                         val    fre
                                                                   1
                         0       0       0       0       4       8       -       -
                  
                                                                            3
                         10      4       1       -       0       2       10       -
                  
                                                                                    3
                         20      2       2       -       -       0       6       12
                  
                  
                         30      6       3       -       -       -       0       3
                  
                                         
                         40      3       4       -       -       -       -       0
 
 Step 4: l = 3
        l = j - i = 3, (i, j) = (0, 3), (1, 4)
 
        All these represents 3 keys i.e, 0 - 3 is  (0, 4, 2, 6), Just ignore the 1st i.e, 0 because wwe added the 0 coloumn and row for our convinience and calculation.
        So it's (4, 2, 6) and same applies for other
        
        0 - 3 = (4, 2, 6) = (10, 20, 30)
        1 - 4 = (2, 6, 3) = (20, 30, 40)
 
        ###################### For 0 - 3 = (4, 2, 6) = (10, 20, 30) ###############################

        Now
                For root = 1 i.e, 10 :                              For root = 2 i.e, 20 :                      For root = 3 i.e, 30 :
 
                10               10                                     20                                          30          30
                  \               \                                   /    \                                        /           /
                   20              30                                10    30                                    20           10
                     \            /                                                                            /               \
                      30         20                                                                           10                20
 
                    [0, __] + [__, 3]                               [0, __] + [__, 3]                             [0, __] + [__, 3]
                    [0, 0] + [1, 3]                                 [0, 1] + [2, 3]                               [0, 2] + [3, 3]
 
        Here total width w[0 - 3], by ignoring 1st key i.e [1 - 3] = 4 + 2 + 6 = 12
 
 
            min {[0, 0] + [1, 3], [0, 1] + [2, 3],  [0, 2] + [3, 3]} + w[0 - 3]
        =   min {  0    +   10  ,   4    +    6  ,    8    +   0  }  + 12
        =   min {       10      ,       10      ,           8     } +  12
        =   8 + 12 = 20
 
        min(10, 10, 8) = 8 and found the value when 3 was root node.
 
 
        And the table will be,
                  
                                          0       1       2       3       4
                  val    fre
                                                            1        3
                  0       0       0       0       4       8       20       -
           
                                                                     3
                  10      4       1       -       0       2       10       -
           
                                                                             3
                  20      2       2       -       -       0       6       12
           
           
                  30      6       3       -       -       -       0       3
           
                                  
                  40      3       4       -       -       -       -       0
 
 
        ###################### For 1 - 4 = (2, 6, 3) = (20, 30, 40) ###############################

        Now
                For root = 2 i.e, 20 :                              For root = 3 i.e, 20 :                      For root = 4 i.e, 30 :
 
                20               20                                     30                                          40          40
                  \                \                                  /    \                                        /           /
                   30               40                               20    40                                    30           20
                     \              /                                                                           /               \
                      40           30                                                                          20                30
 
                    [1, __] + [__, 4]                               [1, __] + [__, 4]                             [1, __] + [__, 4]
                    [1, 1] + [2, 4]                                 [1, 2] + [3, 4]                               [1, 3] + [4, 4]
 
        Here total width w[1 - 4], by ignoring 1st key i.e [2 - 4] = 2 + 6 + 3 = 11
 
 
            min {[1, 1] + [2, 4], [1, 2] + [3, 4],  [1, 3] + [4, 4]} + w[1 - 4]
        =   min {  0    +   12  ,   2    +    3  ,    10    +   0  } + 11
        =   min {       12      ,       5      ,           10     } +  11
        =   5 + 11 = 16
 
        min(12, 5, 10) = 5 and found the value when 3 was root node.
 
 
        And the table will be,
                  
                                          0       1       2       3       4
                  val    fre
                                                            1        3
                  0       0       0       0       4       8       20       -
           
                                                                     3       3
                  10      4       1       -       0       2       10       16
           
                                                                             3
                  20      2       2       -       -       0       6       12
           
           
                  30      6       3       -       -       -       0       3
           
                                  
                  40      3       4       -       -       -       -       0

 
 Step 5: l = 4
        l = j - i = 4, (i, j) = (0, 4)
 
        All these represents 4 keys i.e, 0 - 4 is  (0, 4, 2, 6, 3), Just ignore the 1st i.e, 0 because wwe added the 0 coloumn and row for our convinience and calculation.
        So it's (4, 2, 6, 3)
        
        0 - 4 = (4, 2, 6, 3) = (10, 20, 30, 40)
 
        Here total width w[0 - 4], by ignoring 1st key i.e [1 - 4] = 4 + 2 + 6 + 3 = 15
 
        Let's have the formula to calculate :
 
            min {[0, _] + [_, 4]  ,  [0, _] + [_, 4]  ,  [0, _] + [_, 4]  ,  [0, _] + [_, 4]} + w[0 - 4]
        =   min {[0, 0] + [1, 4]  ,  [0, 1] + [2, 4]  ,  [0, 2] + [3, 4]  ,  [0, 3] + [4, 4]} + w[0 - 4]
        =   min {   0   +   16    ,     4   +   12    ,     8   +   3     ,     20  +   0   } + 15
        =   min {       16        ,         16        ,         11        ,         20      } + 15
        =   11  +   15
        =   26
 
        min(16, 16, 11, 20) = 11 and found the value when 3 was root node.
 
 
 
        And the table will be,
                  
                                          0       1       2       3       4
                  val    fre
                                                   1        1        3       3
                  0       0       0       0       4       8       20       26
           
                                                            2        3       3
                  10      4       1       -       0       2       10       16
           
                                                                   3         3
                  20      2       2       -       -       0       6       12
           
                                                                            4
                  30      6       3       -       -       -       0       3
           
                                  
                  40      3       4       -       -       -       -       0
 
 
 
        So here we get the answer as 26 and the root is 3, let's form the tree :
                    
                                          R(0, 4) = [0, 2] + [3, 4]
                                            3(30)
                                        /     \
                                      /        \
                                R(0 , 2)        R(3, 4)
                                    1(10)          4(40)
                               /        \           /   \
                            R(0, 0)   R[1, 2]   R[3, 3]  R[4, 4]
                                0       2(20)       0       0
                                      /   \
                                 R[1, 1]  R[2, 2]
                                    0       0
 
 
 
            =                       30
                                  /   \
                                10     40
                                  \
                                   20
 */

func getSum(freq: [Int], i: Int, j: Int) -> Int {
    var sum = 0
    for x in i...j {
        sum += freq[x]
    }
    return sum
}

func optimalSearchTree(input: [Int], freq: [Int]) -> Int {
    let l1 = input.count
    var T = Array(repeating: Array(repeating: 0, count: l1), count: l1)
    for i in 0...l1-1 {
        T[i][i] = freq[i]
    }
    for l in 2...l1 {
        for i in 0...l1-l {
            let j = i + l - 1
            T[i][j] = Int.max
            let sum = getSum(freq: freq, i: i, j: j)
            for k in i...j {
                let val = sum + (k-1 < i ? 0 : T[i][k-1]) + (k+1 > j ? 0 : T[k+1][j])
                if(val < T[i][j]) {
                    T[i][j] = val
                }
            }
        }
    }
    T
    return T[0][l1-1]
}

let input = [10, 20, 30, 40]
let freq = [4, 2, 6, 3]
let result = optimalSearchTree(input: input, freq: freq)
