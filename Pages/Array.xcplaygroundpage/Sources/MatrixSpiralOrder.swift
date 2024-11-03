//
//  MatrixSpiralOrder.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/* Approach
   Step 1: Have four pointers top, left, right, bottom and direction variable
   Step 2: As long as left <= right and top <= bottom
   Step 3: Based on the direction
            case 0 : Iterate from left ...right , result.append(matrix[top][index]) , top += 1
            case 1:  Iterate from top...bottom , result.append(matrix[index][right]) , right += 1
            case 2: Iterate from (left...right).reversed(), result.append(matrix[bottom][index], bottom -= 1
            case 3 : Iterate frm (top...bottom).reversed(), result.append(matrix[index][left], left += 1
 
  Time Compelxity : O(n)
  Space Complexity : O(n)
 
 */

public class MatrixSpiralOrder {
    public init() { }
    
    public func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        let m = matrix.count // row count
        let n = matrix[0].count // colum count
        var left = 0 , right = m - 1
        var top = 0 , bottom = n - 1
        var direction = 0
        
        while left <= right && top <= bottom {
            switch direction {
            case 0 :
                // top row
                for index in left...right {
                    result.append(matrix[top][index])
                }
                top += 1
            case 1:
                // right side column
                for index in top...bottom {
                    result.append(matrix[index][right])
                }
                right -= 1
            case 2:
                // bottom row
                for index in (left...right).reversed() {
                    result.append(matrix[bottom][index])
                }
                bottom -= 1
            case 3:
                // first column
                for index in (top...bottom).reversed() {
                    result.append(matrix[index][left])
                }
                left += 1
            default: break
            }
            direction = (direction + 1) % 4
        }
        return result
    }
}

/*
 Input:
  matrix: [
    [1,2,3],
    [4,5,6],
    [7,8,9]
   ]
 
 Output: [1,2,3,6,9,8,7,4,5]
 
 */
