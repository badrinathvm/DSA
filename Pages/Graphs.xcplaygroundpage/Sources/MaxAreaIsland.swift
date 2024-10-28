//
//  MaxAreaIsland.swift
//  
//
//  Created by Rani Badri on 10/27/24.
//

/**
Time Complexity : O( M x N ) where M is the number of rows and N is the number of columns. Each cell is visited once
Space Compelxity : O( M x  N) for the recursion stack in the worst case (if the grid is entirely land).
 */

public class MaxAreaIsland {
    public init() {}
    
    public func maxAreaIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count, columns = grid[0].count
        var maxArea = 0
        
        func dfs(_ row: Int, _ column: Int) -> Int {
            guard row >= 0, row < rows, column >= 0, column < columns, grid[row][column] == 1 else { return 0 }
            
            // Mark the cells as visited
            grid[row][column] = 0
            var area = 1
            
            // Explore all four directions
            area += dfs(row-1, column)
            area += dfs(row + 1, column)
            area += dfs(row, column - 1)
            area += dfs(row, column + 1)
            
            return area
        }
        
        for row in 0..<rows {
            for column in 0..<columns {
                if grid[row][column] == 1 {
                    maxArea = max(maxArea, dfs(row, column))
                }
            }
        }
        
        return maxArea
    }
}

/**
 
 Input :
 [
   [0,0,1,0,0],
   [1,1,1,0,0],
   [0,1,0,0,1],
   [0,0,0,1,1]
 ]
 
 Output : 5
 
 1. Start at (0,2) and initiate DFS, finding an area of 4.
 2. Next, (1,0) initiates DFS, connecting to (1,1), (1,2), and part of (0,2), with an area of 5.
 3. Finally, (3,3) and (3,4) count as another island with an area of 2.
 
 The largest area is 5.

 */
