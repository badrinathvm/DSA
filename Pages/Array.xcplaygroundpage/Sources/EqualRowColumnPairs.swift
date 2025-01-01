//
//  Untitled.swift
//  
//
//  Created by Rani Badri on 12/31/24.
//

/*
 Explanation
     1.    Row Representation:
        •    Convert each row to a string key (or tuple) to store in the dictionary rowCount.
     2.    Column Representation:
        •    Extract columns from the grid by iterating over rows for each column index.
     3.    Match Rows and Columns:
        •    For each column, check if its string key exists in rowCount. If it does, add the corresponding value (number of occurrences).
 
 Complexity
     •    Time Complexity: O(n^2)
        •      Counting rows: O(n^2)
     •    Extracting columns and checking matches: O(n^2)
        •    Space Complexity: O(n^2) for the dictionary to store rows.
 */

public class EqualRowColumnPairs {
    public init() { }
    
    public func equalPairs(_ grid: [[Int]]) -> Int {
        var rowCount: [String: Int] = [:]
        let n = grid.count
        
        // Count occurrences of rows
        for row in grid {
            let key = row.map(String.init).joined(separator: ",")
            rowCount[key, default: 0] += 1
        }
        
        //  {"3,2,1": 1, "1,7,6" : 1 }
        
        var count = 0
        
        // Count matching columns
        for col in 0..<n {
            var column: [Int] = []
            for row in 0..<n {
                column.append(grid[row][col])
            }
            let key = column.map(String.init).joined(separator: ",")
            if let matches = rowCount[key] {
                count += matches
            }
        }
        
        return count
    }
}

/*
 
 Input: grid = [[3,2,1],[1,7,6],[2,7,7]]
 Output: 1
     Explanation: There is 1 equal row and column pair:
     - (Row 2, Column 1): [2,7,7]
 */

