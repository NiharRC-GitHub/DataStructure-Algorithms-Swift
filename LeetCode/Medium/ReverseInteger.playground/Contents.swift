/*
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
  

 Constraints:

 -231 <= x <= 231 - 1
 */

func reverse(_ x: Int) -> Int {
    var x = x
    var result = 0
    while x != 0 {
        let reminder = x % 10
        
        // because in the next we will multiply 10 with the result and then add the remider. If it is already greater or equal and the reminder is greater than 7, then the max range of Int will overflow. So return 0
        /*
         We use this logic:

         if result > Int32.max / 10 || (result == Int32.max / 10 && reminder > 7) return 0
         Because:

         If result > Int32.max / 10, then multiplying by 10 will already exceed Int32.max.

         If result == Int32.max / 10, and reminder > 7, it will exceed 2,147,483,647.

         Same logic for negative side and Int32.min.
         */
        if result > Int32.max / 10 || (result == Int32.max / 10 && reminder > 7) {
            return 0
        }
        if result < Int32.min / 10 || (result == Int32.min / 10 && reminder < -8) {
            return 0
        }
        
        result = result * 10 + reminder
        
        x = x/10
    }
    return result
}

print(reverse(123))
print(reverse(-123))
print(reverse(120))
print(reverse(-1463847412))
