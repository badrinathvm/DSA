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
