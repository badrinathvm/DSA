//
//  DiagonalTraverse.swift
//  
//
//  Created by Rani Badri on 1/3/25.
//

/*
   Simulate the diaginal traversak by iterating throught he diagonals one by one.
    1. Moving upwards ( up and right) =>  ( row - 1, col + 1)
    2. Moving Downwards ( down and left ) => ( row + 1, col - 1)
 
 Time Complexity: O(m \times n), where m is the number of rows and n is the number of columns, as we traverse each element once.
 Space Complexity: O(1) (excluding the result array), as no extra space is used.
 
 */

public class DiagonalTraverse {
    public init() { }
    
    public func diagonalTraverse(_ mat: [[Int]]) -> [Int] {
        let m = mat.count , n = mat[0].count
        var result: [Int] = []
        var row = 0
        var col = 0
        var upward = true
        
        while result.count < m * n {
            result.append(mat[row][col])
            
            switch upward {
            case true:
                // out of bounds right, then got to next row and set upward to false
                if col == n - 1 {
                    row += 1
                    upward = false
                } else if row == 0 { // out of bounds top, got to next column and set upward to false
                    col += 1
                    upward = false
                } else {
                    row -= 1
                    col += 1
                }
            case false:
                // out of bounds bottom, then go to next col and set upward to true
                if row == m - 1 {
                    col += 1
                    upward = true
                } else if col == 0 {  // Out of bounds on the left, got to next tow and set upward to true
                    row += 1
                    upward = true
                } else {
                    row += 1
                    col -= 1
                }
            }
        }
        
        return result
    }
}

/*
 
 Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,4,7,5,3,6,8,9]
 

 */
