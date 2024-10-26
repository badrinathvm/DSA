//
//  SumOfDiagonals.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

// Time Complexity - O(N)
// Space Complexity - O(1)
public class SumOfDiagonals {
    public init() { }
    
    public func sumDiagonals(arr: [[Int]]) -> Int {
        let row = arr.count, col = arr[0].count
        var sum = 0
        
        // Diaginal sum is applicable only for the square matrix
        let isSquare = row == col
        // We need this to avoid the double counting of the mid element
        let isOddDimensions = row % 2 != 0 && col % 2 != 0
        
        guard row > 0 && col > 0 && isSquare else { return 0 }
        
        let midElement = arr[row / 2][col / 2]
        print(midElement)
        
        for i in 0..<row {
            for j in 0..<col {
                if i == j {
                    sum += arr[i][j]
                }
                
                if i == (row - 1) - j {
                    sum += arr[i][j]
                }
            }
        }
        
        if isOddDimensions {
            sum -= midElement
        }
        
        return sum
    }
}

/*

 Input :
 [
   [ 1,  2,  3,  4, 5],
   [ 5,  6,  7,  8, 10],
   [ 9, 10, 11, 12, 14],
   [13, 14, 15, 16, 15],
   [13, 14, 15, 16, 15]
   [13, 14, 15, 16, 15]
 ]
 
 
 output :
   
 */
