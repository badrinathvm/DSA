//
//  IslandPerimeter.swift
//  
//
//  Created by Rani Badri on 10/27/24.
//
/**
  Time Complexity - O(M x N) , where M abd N are the dimensions of the grid.
Space Complexity  - O(1) , as we only use a constant amount of extra space for variables.
 */
public class IslandPerimeter {
    public init() { }
    
    public func islandPreimeter(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var perimeter = 0
        
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 1 {
                    perimeter += 4 // start with four sides
                    
                    // top
                    if row > 0 && grid[row-1][col] == 1 {
                        perimeter -= 1
                    }
                    
                    // bottom
                    if row < rows - 1 && grid[row+1][col] == 1 {
                        perimeter -= 1
                    }
                    
                    // left
                    if col > 0 && grid[row][col-1] == 1 {
                        perimeter -= 1
                    }
                    
                    // bottom
                    if col < cols - 1 && grid[row][col+1] == 1 {
                        perimeter -= 1
                    }
                }
            }
        }
        
        return perimeter
    }
}
