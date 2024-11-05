//
//  NumberOfIslands.swift
//  
//
//  Created by Rani Badri on 10/27/24.
//

/*
  Time Complexity : O(M X N) where M is the number of rows and N is the number of cols
  Space Compelxity : O(M x N) due to recursive calls if the entier grid is filled with 1's
 */

public class NumberOfIslands {
    public init() {
    }
    
    public func numIslands(_ grid: [[String]]) -> Int {
        var grid = grid
        let rows = grid.count, cols = grid[0].count
        var islandCount = 0
        

        func dfs(_ row: Int, _ col: Int) {
           if row < 0 || col < 0 || row >= rows || col >= cols || grid[row][col] != "1" {
                return
            }
            
            grid[row][col] = "0"
            
            // visit the neighboring nodes
            dfs(row-1, col) // down
            dfs(row+1, col) // up
            dfs(row, col-1) // right
            dfs(row, col+1) // left
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == "1" {
                    islandCount += 1
                    dfs(row, col)
                }
            }
        }
        
        return islandCount
    }
}

/*
 
 Input :
 
 [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 
 Output:
 
  1
 
 
 */
