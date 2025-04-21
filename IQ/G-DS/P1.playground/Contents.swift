/*
Given two lists of characters, one is a Scheme and the other is a Target, sort the Target according to the order specified in the Scheme.
An example:
Scheme (m elements) -> a, b, c
Target (n elements) -> a, c, f, e, b
The sorted result should be: a, b, c, f, e
 */


func customSortWithLoop(scheme: [Character], target: [Character]) -> [Character] {
    var schemeOrder: [Character: Int] = [:]

        // Step 1: Build the order map using a simple for loop
        for i in 0..<scheme.count {
            schemeOrder[scheme[i]] = i
        }

        // Step 2: Split target into two parts: those in scheme and those not
        var inScheme: [Character] = []
        var notInScheme: [Character] = []

        for char in target {
            if schemeOrder[char] != nil {
                inScheme.append(char)
            } else {
                notInScheme.append(char)
            }
        }

        // Step 3: Sort the in-scheme characters based on their order in scheme
        for i in 0..<inScheme.count {
            for j in i+1..<inScheme.count {
                if schemeOrder[inScheme[j]]! < schemeOrder[inScheme[i]]! {
                    inScheme.swapAt(i, j)
                }
            }
        }

        // Step 4: Combine the sorted in-scheme characters with the others
        return inScheme + notInScheme
}

// Example usage:
let scheme: [Character] = ["a", "b", "c"]
let target: [Character] = ["a", "a", "c", "f", "e", "b"]
let sorted = customSortWithLoop(scheme: scheme, target: target)
print(sorted) // Output: ["a", "a", "b", "c", "f", "e"]

/*
 Given:
 m = number of elements in the scheme array

 n = number of elements in the target array

 Step-by-step time analysis:
 Building schemeOrder dictionary

 swift
 Copy
 Edit
 for i in 0..<scheme.count {
     schemeOrder[scheme[i]] = i
 }
 ✅ Time: O(m)

 Splitting target into inScheme and notInScheme

 swift
 Copy
 Edit
 for char in target {
     if schemeOrder[char] != nil {
         inScheme.append(char)
     } else {
         notInScheme.append(char)
     }
 }
 ✅ Time: O(n) — one pass through target

 Sorting inScheme manually (nested loop)
 This part is a simple selection sort:

 swift
 Copy
 Edit
 for i in 0..<inScheme.count {
     for j in i+1..<inScheme.count {
         ...
     }
 }
 Worst-case: all n elements are in the scheme → sorting n elements ✅ Time: O(k²), where k is the number of elements in target that exist in the scheme

 In worst case, k = n, so sorting takes O(n²)

 Combining the two arrays (inScheme + notInScheme)
 ✅ Time: O(n)

 ✅ Final Time Complexity:
 scss
 Copy
 Edit
 O(m + n + k²)
 Best case (small k): O(m + n)

 Worst case (k ≈ n): O(m + n²)
 */
