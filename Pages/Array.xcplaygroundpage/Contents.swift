import UIKit

var greeting = "Hello, playground"

class TwoSum {
    func twoSum(nums: [Int], target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (index, element) in nums.enumerated() {
            // identify the potential number
            let potentialNumber = target - element
            
            if let complementIndex = dict[potentialNumber] {
                // If it is, return the current index and the index of the complement
                return [complementIndex, index]
            } else {
                // If it's not, add the current number and its index to the dictionary
                dict[element] = index
            }
        }
        return []
    }
}

let twoSum = TwoSum()
let result = twoSum.twoSum(nums: [2,7,11,15], target: 9)
print(result)


class Merge {
    static func merge(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        let temp1 = nums1[0..<m]
        let temp2 = nums2[0..<n]
        let mergedArray = Array(temp1) + Array(temp2)
        print(mergedArray.sorted(by: <))
    }
}

//Merge.merge([1,2,3,0,0,0], 3, [2,5,6], 3)
//Merge.merge([1], 1, [], 0)
Merge.merge([0], 0, [1], 1)

class MoveZeros {
    static func moveZeros(nums: [Int]) {
        // identify the number of zeros
        print("Normal approach")
        let zeroCount = nums.filter { $0 == 0}.count
        var wihtOutZeroArray = nums.filter { $0 != 0 }
        wihtOutZeroArray.append(contentsOf: Array(repeating: 0, count: zeroCount))
        print(wihtOutZeroArray)
        
        
        // Using Reduce way
        print("Using Reduce Way")
        let result = nums.reduce(into: ([Int](), 0)) { result, num in
            if num == 0 {
                result.1 += 1
            } else {
                result.0.append(num)
            }
        }
        
        let (withoutZero, count) = result
        let finalArray = withoutZero + Array(repeating: 0, count: count)
        print(finalArray)
    }
}

MoveZeros.moveZeros(nums: [0,1,0,3,12])

class ZigZag {
    static func zigZag(arr: inout [Int]) {
        for index in 0..<arr.count - 1 {
            if index % 2 == 0 {
                // If i is even, arr[i] should be less than or equal to arr[i+1]
                if arr[index] > arr[index + 1] {
                    arr.swapAt(index, index + 1)
                }
            } else {
                // If i is odd, arr[i] should be greater than or equal to arr[i+1]
                if arr[index] < arr[index+1] {
                    arr.swapAt(index, index+1)
                }
            }
        }
        print(arr)
    }
}

var arr = [4, 3, 7, 8, 6, 2, 1]
ZigZag.zigZag(arr: &arr)

class MatrixSpiralOrder {
    static func spiralOrder(matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        
        let m = matrix.count // row count
        let n = matrix[0].count // column count
        // have pointers for each of them
        var top = 0, right = n - 1, left = 0 , bottom = m-1
        var direction = 0
        
        while ( left <= right && top <= bottom ) {
            switch direction {
            case  0 : // top row ( traverse from left to right keeping top as constant so increment top.)
                    for index in left...right {
                        result.append(matrix[top][index])
                    }
                    top += 1
            case 1: // last column ( traverse from top to bottom keeping right as constant so decrement right)
                for index in top...bottom {
                    result.append(matrix[index][right])
                }
                right -= 1
            case 2: // bottom row ( traverse from bottom to left keeping bottom 
                for index in (left...right).reversed() {
                    result.append(matrix[bottom][index])
                }
                bottom -= 1
            case 3: // first column ( traverse from bottom to top keeping left as constant sp increemnt left )
                for index in (top...bottom).reversed() {
                    result.append(matrix[index][left])
                }
                left += 1
            default:
                break
            }
            direction = (direction + 1) % 4 //( why 4 ? because there are four pointer left , right , top, bottom )
        }
        return result
    }
}

print(MatrixSpiralOrder.spiralOrder(matrix: [[1,2,3],[4,5,6],[7,8,9]]))


class RotateMatrix {
    static func rotateMatrix( matrix: inout [[Int]]) {
        var l = 0 , r = matrix.count - 1
        while l < r {
            for index in 0..<(r - l) {
                var top = l, bottom = r
                
                // to make use of index,
                    // 1. increase the left pointer by index, 
                    // 2. decrease bottom by index
                    // 3. decrease right pointer by index
                    // 4. Increase top pointer by index
                
                // save the top left in a temp variable
                var topLeft = matrix[top][l + index]
                
                // move bottom left to top left
                matrix[top][l + index] = matrix[bottom - index][l]
                
                // move bottom right in to bottom left
                matrix[bottom - index][l] = matrix[bottom][r - index]
                
                // move top right in to bottom right
                matrix[bottom][r - index] = matrix[top + index][r]
                
                // move top Left to right
                matrix[top + index][r] = topLeft
            }
           r -= 1
           l += 1
        }
        print(matrix)
    }
}

var matrix1 = [[1,2,3],[4,5,6],[7,8,9]]
RotateMatrix.rotateMatrix(matrix: &matrix1)


class RemoveElement {
    static func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { $0 != val }
        return nums.count
    }
}

// RemoveElement.removeElement([3,2,2,3], 3)
var nums = [0,1,2,2,3,0,4,2]
RemoveElement.removeElement(&nums, 2)

class CountNumberOfTeams {
    
    static func numberOfTeams(_ rating: [Int]) -> Int {
        // A team is valid if (rating[i] < rating[j] < rating [k])
        // or (rating[i] >rating[j]> rating[k])
        var n = rating.count
        var count = 0
        for i in 0..<n {
            for j in (i+1)..<n {
                for k in (j+1)..<n {
                    if (rating[i] < rating[j] && rating[j] < rating[k]) || (rating[i] > rating[j] && rating[j] > rating[k]) {
                        count += 1
                    }
                }
            }
        }
        return count
        
//        let n = rating.count
//        let pairs = (0..<n).flatMap { i in
//                (i+1..<n).flatMap { j in
//                    (j+1..<n).filter { k in
//                        (rating[i] < rating[j] && rating[j] < rating[k]) || (rating[i] > rating[j] && rating[j] > rating[k])
//                    }
//                }
//            }
//        print("Pairs \(pairs)")
//        return pairs.count
    }
}

CountNumberOfTeams.numberOfTeams([2,5,3,4,1])


//Minimum Punches
// Leetcode Question : https://leetcode.com/problems/minimum-number-of-pushes-to-type-word-ii/
class MinimumPunches {
    static func minimumPunches(_ word: String) -> Int {
        // Initilaze the arry with 0 for 26 alphabets
        var counts = Array(repeating: 0, count: 26)
        
        // in order to construct array from 0 to 25 ( counting the frequency of each of the lower case character
        for c in word {
            // get the ascii value of the character 'c'
            // 'Character("a").asciiValue!' gets the ASCII value of 'a' (which is 97)
            // Subtracting this value from 'asciiValue' gives a zero-based index:
            // 'a' -> 0, 'b' -> 1, ..., 'z' -> 25
            if let asciiValue = c.asciiValue {
                counts[Int(asciiValue) - Int(Character("a").asciiValue!)] += 1
            }
        }
        
        var res = 0
        var distinct = 0
        
        // why 8 ? because key pad 1 wont have any character
        for cnt in counts {
            // till 8 characaters it only single key press
            // after 8 till 15 it rquires 2 key press
            // from 15 till 25 it requires 3 key press that is teh formula below.
            res += cnt * ( 1 + distinct / 8 )
            // because as we going through each count we need to disctinct to be updated.
            // to handle the logic in batches.
            distinct += 1
        }
        
        return res
    }
}


print(MinimumPunches.minimumPunches("abc"))


// Leetcode 1004 : https://leetcode.com/problems/max-consecutive-ones-iii/
class MaxConsecutiveOnes {
    static func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        // Two pointer approach
        var left = 0
        var maxCons = 0
        var k = k

        // Iterate through the array with the right pointer
        for (right, num) in nums.enumerated() {
            // Decrease k for each 0 encountered, as we're allowed to flip up to k zeros
            k -= 1 - num

            // If k becomes less than 0, adjust the left pointer to reduce the window size
            if k < 0 {
                // Give back '0' to k when left pointer moves past a zero
                k += 1 - nums[left]
                left += 1
            } else {
                // Update the maximum consecutive ones that can be achieved with flips
                maxCons = max(maxCons, right - left + 1)
            }
        }

        return maxCons
    }
}


MaxConsecutiveOnes.longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2) // 6

class SortColors {
    static func sortColors(_ nums: inout [Int]) {
        // Make use of bucket sort
        // first pass : Iterate over the array and keep track of how many frequency of eahc of the element.
        // second pass: Implement those buckets
        
        // Step 1: Count occurrences of each color (0, 1, 2)
        var count = [0, 0, 0]
            
        // Count the occurrences of 0, 1, and 2
        for num in nums {
            count[num] += 1
        }
        print(count)
        
        // Step 2: Overwrite the original array based on the counts
        var index = 0

        // Fill in 0s (red)
        for _ in 0..<count[0] {
            nums[index] = 0
            index += 1
        }
        
        // Fill in 0s (green)
        for _ in 0..<count[1] {
            nums[index] = 1
            index += 1
        }
        
        // Fill in 0s (blue)
        for _ in 0..<count[2] {
            nums[index] = 2
            index += 1
        }
        
        print(nums)
    }
    
    static func sortColorsSimplified(_ nums: inout [Int]) {
        // Step 1: Count occurrences of each color using reduce
        let count = nums.reduce(into : [0,0,0]) { counts, element in
            counts[element] += 1
        }
        
        // Step 2: Reconstruct the array by repeating elements based on their counts
        nums = count.enumerated().flatMap { color, element in
            Array(repeating: color, count: element)
        }
    }
}

var colors = [2,0,2,1,1,0]
SortColors.sortColorsSimplified(&colors)

