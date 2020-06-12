/*
Created by nihar chadhei
 
 * Given two strings how many minimum edit needs to convert one string to another
 
    Ex: str1 = "adefc"
        str2 = "bdhc"
 
                                                     edit
                                                    /    \
                                                  /       \
                                                /          \
                            Char same, no operation         Char not same
                        str1[4] == str2[3] = c == c         str1[3] != str2[2] = f != h
    So need operation for rest i.e, "adef" and "bdh"        So, here we can do 3 different operation but we need minimum one
                                                                            /       |       \
                                                                        Replace  Insert   Delete
 Solution:
 
    Lets create the table T[][]. i = Coloumn = 0 < str1.length and j = Row = 0 < str2.length
    
                ""      a       d       e       f       c
 
        ""      -       -       -       -       -       -
 
        b       -       -       -       -       -       -
 
        d       -       -       -       -       -       -
 
        h       -       -       -       -       -       -
 
        c       -       -       -       -       -       -
 
 
    Step 1:
    
                ""      a       d       e       f       c
 
        ""      0       1       2       3       4       5
 
        b       1       -       -       -       -       -
 
        d       2       -       -       -       -       -
 
        h       3       -       -       -       -       -
 
        c       4       -       -       -       -       -
 
 
        Assigned 1st row = 0, 1, 2, 3, 4, 5 and 1st coloumn = 0, 1, 2, 3, 4. It's not random.
 
        Explanation:
            T[0][0] = 0, because to convert "" with "", needs 0 time as both are same and no need to do any operation
            
            1st Row:
 
                T[0][1] = 1, because to convert "a" with "", needs 1 time as "a" need to rplace with "" and string has one charecter. So 1 time.
                T[0][2] = 2, because to convert "ab" with "", needs 1 time as "ab" need to rplace with "" and string has two charecter. So 2 times.
                Same for T[0][3] = 3, T[0][4] = 4, T[0][5] = 5
 
            1st Coloumn:
 
            Same as Row. T[1][0] = 1, T[2][0] = 2, T[3][0] = 3, T[4][0] = 4
 
 
    Step 2:
    
                ""      a       d       e       f       c
 
        ""      0       1       2       3       4       5
 
        b       1       1       2       3       4       5
 
        d       2       -       -       -       -       -
 
        h       3       -       -       -       -       -
 
        c       4       -       -       -       -       -
 
        
        So here,
 
            T[1][1] = 1
                To convert "a" to "b", we replace "a" = "b". So minimum operation to get the value "b" is 1.
 
            T[1][2] = 2
                To convert "ad" to "b", we will delete "d", then we replace "a" = "b". So minimum operation to get the value "b" is 2.
 
            So how we are getting these values, If you we will notice in the table then:
    
            if str[i] != str[j] {
                T[i][j] = 1 + min(T[i-1][j-1], T[i-1][j], T[i][j-1])
            }
 
            For T[1][1]:
    
                T[1][1] = 1 + min(T[1-1][1-1], T[1-1][1], T[1][1-1])
                        = 1 + min(0, 1, 1) = 0 + 1 = 1
 
            Same for other values.
 

    Step 3:
    
                ""      a       d       e       f       c
 
        ""      0       1       2       3       4       5
 
        b       1       1       2       3       4       5
 
        d       2       2       1       2       3       4
 
        h       3       -       -       -       -       -
 
        c       4       -       -       -       -       -
 
        So, here we got one more case i.e, T[2][2].
 
        T[2][2] = 1
            To convert "ad" to "bd", I already mention we can skip same char i.e "d" in both.
            Then the rest is "a" and "b" i.e, T[1][1] = 1
            So the value is T[2][2] = T[1][1] = 1
 
            New Condition i.e,
            
            if str[i] == str[j] {
                T[i][j] = T[i-1][j-1]
            }
 
 
    Step 3:
    
                ""      a       d       e       f       c
 
        ""      0       1       2       3       4       5
 
        b       1       1       2       3       4       5
 
        d       2       2       1       2       3       4
 
        h       3       3       2       2       3       4
 
        c       4       -       -       -       -       -
 
 
    Step 4:
    
                ""      a       d       e       f       c
 
        ""      0       1       2       3       4       5
 
        b       1       1       2       3       4       5
 
        d       2       2       1       2       3       4
 
        h       3       3       2       2       3       4
 
        c       4       4       3       3       3       3

    
    So the result is T[i][j] = 3

*/

func minimumEditDistancDP(str1: String, str2: String) -> Int {
    let l1 = str1.count
    let l2 = str2.count
    let arrSize = l1 > l2 ? l1 : l2
    var T = Array(repeating: Array(repeating: 0, count: arrSize+1), count: arrSize+1)
    
    for i in 0...l1 {
        T[0][i] = i
    }
    
    for j in 0...l2 {
        T[j][0] = j
    }
    
    for i in 1...l1 {
        for j in 1...l2 {
            if  String(str1.suffix(l1 - (i - 1))).first == String(str2.suffix(l2 - (j - 1))).first {
                T[i][j] = T[i-1][j-1]
            } else {
                T[i][j] = 1 + min(T[i-1][j-1], T[i-1][j], T[i][j-1])
            }
        }
    }
    printTheEditsAreDone(T: T, str1: str1, str2: str2)
    return T[l1][l2]
}


func printTheEditsAreDone(T: [[Int]], str1: String, str2: String) {
    let l1 = str1.count
    let l2 = str2.count
    let arrSize = l1 > l2 ? l1 - l2 : l2 - l1
    var i = T.count - 2
    var j = T[0].count - (2 + arrSize)
    
    while(true) {
        if (i == 0 || j == 0) {
            break
        }
        if String(str1.suffix(l1 - (i - 1))).first == String(str2.suffix(l2 - (j - 1))).first {
            i = i-1
            j = j-1
        } else if (T[i][j] == T[i-1][j-1] + 1),
            let c2 = String(str2.suffix(l2 - (j - 1))).first,
            let c1 = String(str1.suffix(l1 - (i - 1))).first  {
            print("Edit ", c2, " in string2 to ", c1, " in string1")
            i = i - 1
            j = j - 1
        } else if (T[i][j] == T[i-1][j] + 1),
            let c1 = String(str1.suffix(l1 - (i - 1))).first {
            print("Delete in string1 ", c1)
            i = i - 1
        } else if (T[i][j] == T[i][j-1] + 1),
            let c2 = String(str2.suffix(l2 - (j - 1))).first {
            print("Delete in string2 ", c2)
            j = j - 1
        } else {
            break
        }
        
    }
}

let str1 = "adefc"
let str2 = "bdhc"
let result = minimumEditDistancDP(str1: str1, str2: str2)
print("Result : ", result)

/*
 Edit  h  in string2 to  f  in string1
 Delete in string1  e
 Edit  b  in string2 to  a  in string1
 Result :  3
 */
