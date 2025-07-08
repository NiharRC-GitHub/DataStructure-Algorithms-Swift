/*
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.

 Notice that you may not slant the container.

  

 Example 1:


 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 Example 2:

 Input: height = [1,1]
 Output: 1
  

 Constraints:

 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104
 */

func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var maxArea: Int = 0
    
    //Start with two pointers at the leftmost and rightmost lines and compute the area
    //Move the pointer pointing to the shorter line inward, because that's the only way you might find a taller line that could increase the area.
    while left < right {
        //Area = min(height[left], height[right]) * (right - left)
        let areaHeight = min(height[left], height[right]) // Water can only store upto min height bar
        let width = right - left
        let area: Int = areaHeight * width
        maxArea = max(maxArea, area)
        
        if height[left] < height[right] { // always keep the taller line and move from min line
            left += 1
        } else {
            right -= 1
        }
    }
    return maxArea
}

print(maxArea([1,8,6,2,5,4,8,3,7]))
/*
 Max area is between lines at index 1 (height 8) and index 8 (height 7)

 Area = min(8, 7) * (8 - 1) = 7 * 7 = 49
 */
print(maxArea([1,1]))
