//
//  IslandPerimeter.swift
//  
//
//  Created by Rani Badri on 10/27/24.
//

public class IslandPerimeter {
    public init() { }
    
    public func islandPreimeter(_ grid: [[Int]]) -> Int {
        var rows = grid.count
        var cols = grid[0].count
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
