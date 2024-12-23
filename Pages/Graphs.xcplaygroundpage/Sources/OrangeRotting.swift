//
//  OrangeRotting.swift
//  
//
//  Created by Rani Badri on 12/12/24.
//

/*
  Time complexity : O ( Rows * Cols ) 
 
 */

/*
   Ever minute, any freash arrange that is 4-directionally adjacent to a rotten orange becomes rottne,
        Return the minimum number of minutes.
        if it is impossible to rot all oranges, return -1
 
 Understand Direction
 (1, 0): Move down (increase the row index by 1, column index remains the same).
 (0, 1): Move right (increase the column index by 1, row index remains the same).
 (-1, 0): Move up (decrease the row index by 1, column index remains the same).
 (0, -1): Move left (decrease the column index by 1, row index remains the same).
 
 Approach:
  Breadth First Search:
        1. Use a queue to process all initially rotten oranges.
        2. Keep track of the time elapsed and propogate the rot in all four directions (0,1) , (1,0) , (0, -1) , (-1,0)
        3. For every fresh orange that becomes rotten, decrement the count of fresh oranges.
  Edge Cases:
    1. If there are no fresh oranges initially, return 0.
    2. If there are fresh oranges that cannot be reached by rotten oranges, return -1.
 */

public class OrangeRotting {
    public init() { }
    
    public func orangesRotting(grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count, cols = grid[0].count
        // (row, col, time)
        var queue: Queue<(Int,Int,Int)> = Queue<(Int, Int,Int)>()
        var freshCount = 0
        
        for r in 0..<rows {
            for c in 0..<cols {
                // check if it is rotten orange
                if grid[r][c] == 2 {
                    queue.push((r,c,0))
                } else if grid[r][c] == 1 {
                    freshCount += 1
                }
            }
        }
        
        // directions for 4 - Directional movement
        let directions = [
            // Note : RIGHT and LEFT increment/decrement colums, UP and DOWN increment row
            (0, -1), // Move left
            (0, 1), // Move right
            (1, 0), // Move Down
            (-1,0) // Move up
        ]
        var minutes = 0
        
        while !queue.empty() {
            let (row, col, time) = queue.front
            minutes = time
            _ = queue.pop()
            
            for dir in directions {
                let newRow = row + dir.0
                let newCol = col + dir.1
                
                // Check if the new position is within bounds
                if newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols && grid[newRow][newCol] == 1 {
                    // Rot the fresh orange
                    grid[newRow][newCol] = 2
                    // decrement the frssh orange count
                    freshCount -= 1
                    queue.push((newRow, newCol, time + 1))
                }
            }
        }
        
        // If there are still fresh oranges left, return -1
        return freshCount == 0 ? minutes : -1
    }
}

/*
 
 Input :
 
 let grid = [
     [2, 1, 1],
     [1, 1, 0],
     [0, 1, 1]
 ]
 
 Output: 4
 
 
 */
