//
//  MaximalRectangleIn2DArray.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//

/*
  Approach:
    Step 1: For each row in the matrix, we can calculate the height of 1's up to that row
    Step 2: With these heights, we then apply the largest Rectangle in histogram solution to find the maximal rectangle
    Step 3: the Maximal of these values is the answer.
 
  Time Complexity :  O( m * n ), where "m" is the numbre of rows and "n" is the number of cols
  Space Complexity: O(n), due to auxiliary heights array and stack.
 */

public class MaximalRectangleIn2DArray {
    public init() { }
    
    public func maximalRectangle(_ matrix: [[String]]) -> Int {
        guard !matrix.isEmpty else { return 0 }
        
        let rows = matrix.count, cols = matrix[0].count
        var heights = Array(repeating: 0, count: cols)
        
        var maxArea = 0
        
        for row in 0..<rows {
            // updates the height
            for col in 0..<cols {
                heights[col] = matrix[row][col] == "1" ? heights[col] + 1 : 0
            }
            
            //calculate the largest rectangle for the current row
            maxArea = max(maxArea, largestRectangleArea(heights))
        }
        
        return maxArea
    }
    
    // Helper function to find largest rectangle in histogram
    /*
     For each bar, determine the widest possible rectangle that uses that bar as the shortest bar.
     If a bar is shorter than the previous bar (going left to right),
     it means that the rectangle formed by the previous bars can’t continue beyond the current bar.
        So, we should calculate the rectangle areas up to that point.
     */
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack: [Int] = []
        var maxArea = 0
        let heights = heights + [0] // Add a sentinel value to flush out remaining bars
        
        for i in 0..<heights.count {
            while let last = stack.last, heights[i] < heights[last] {
                let height = heights[stack.removeLast()]
                let width = stack.isEmpty ? i : i - stack.last! - 1
                maxArea = max(maxArea, height * width)
            }
            stack.append(i)
        }
        return maxArea
    }
}

/*
 
  Input:
 [
   ["1", "0", "1", "0", "0"],
   ["1", "0", "1", "1", "1"],
   ["1", "1", "1", "1", "1"],
   ["1", "0", "0", "1", "0"]
 ]
 
  Output:
 
  Maximal Rectangle Area: 6
 
 */
