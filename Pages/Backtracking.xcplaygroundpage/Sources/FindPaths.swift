//
//  FindPaths.swift
//  
//
//  Created by Rani Badri on 1/23/25.
//

/*
 Time and Space Complexity
     1. Time Complexity: O(2^{2n-2})
            •    For an  N \times N  grid, the number of paths is \binom{2n-2}{n-1}, which is exponential for large  N .
     2. Space Complexity: O(2^{2n-2} \cdot m), where  m  is the length of each path ( 2n-2 ) due to storing all paths in the paths array.
 */

import Foundation

public class FindPaths {
    public init() { }
    
    func findPaths(n: Int) -> [String] {
        var paths: [String] = []
        
        func backtrack(currentPath: String, row: Int, col: Int) {
            // If we reach the bottom-right corner, add the path
            if row == n - 1 && col == n - 1 {
                paths.append(currentPath)
                return
            }
            
            // Move Down (D)
            if row < n - 1 {
                backtrack(currentPath: currentPath + "D", row: row + 1, col: col)
            }
            
            // Move Right (R)
            if col < n - 1 {
                backtrack(currentPath: currentPath + "R", row: row, col: col + 1)
            }
        }
        
        backtrack(currentPath: "", row: 0, col: 0)
        return paths
    }
}

/*
 Number of paths: 6
 
 Ouput:
     Paths:
     DDRR
     DRDR
     DRRD
     RDDR
     RDRD
     RRDD
 
 */


