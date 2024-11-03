//
//  PascalTriangle.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

/*
  Time Complexity: O(n ^ 2)
  Space complexity:
        O(n) - if storing only the last row,
        O(n^2) if storing all rows.
 */

public class PascalTriangle {
    public init() {}
    
    public func pascalTriangle(rows: Int) -> [[Int]] {
        var triangle = [[Int]]()
        
        for row in 0..<rows {
            // form the current row
            var currentRow = Array(repeating: 1, count: row + 1)
            
            // now adjust the current row with
            if row > 1 {
                for j in 1..<row {
                    currentRow[j] = triangle[row - 1][j - 1] + triangle[row - 1][j]
                }
            }
            
            // append the current tow to triangle
            triangle.append(currentRow)
        }
        
        return triangle
    }
}

/*
 
  Input : 5
 
  Output:
 
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]
 
 */
