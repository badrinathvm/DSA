//
//  RoateMatrix.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/* Approach
 
   For each of the index
     topLeft = matrix[top][left + index]
     // move bottom left to top left
     matrix[top][left + index] = matrix[bottom - index][left]
 
    // move bottom right to bottom left
    matrix[bottom - index][left] = matrix[bottom][right - index]
 
   // move top right to bottom right
    matrix[bottom][right - index]= matrix[top + index][right]
 
   // move top - left to top right
   matrix[top + index][right] = topLeft
 
 
   Time Complexity: O(n ^ 2)
 */

public class MatrixRotate {
    public init() { }
    
    public func matrixRotate(_ matrix: [[Int]]) -> [[Int]] {
        var matrix = matrix
        var left = 0, right = matrix.count - 1
        while left < right {
            for i in 0..<(right - left) {
                let top = left
                let bottom = right
                
                // Save the top-left value to a temporary variable
                let topLeft = matrix[top][left + i]
                
                // Move bottom-left to top-left
                matrix[top][left + i] = matrix[bottom - i][left]
                
                // Move bottom-right to bottom-left
                matrix[bottom - i][left] = matrix[bottom][right - i]
                
                // Move top-right to bottom-right
                matrix[bottom][right - i] = matrix[top + i][right]
                
                // Move top-left to top-right
                matrix[top + i][right] = topLeft
            }
            
            // Move towards the inner layer
            left += 1
            right -= 1
        }
        return matrix
    }
}

/*
 Input :
 
 
 Output:
 [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
 
 
 */
