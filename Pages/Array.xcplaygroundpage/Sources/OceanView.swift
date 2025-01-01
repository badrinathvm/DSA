//
//  OceanView.swift
//  
//
//  Created by Rani Badri on 12/31/24.
//

/*
  Approach:
  1. Traverse from Right to Left:
     - Start from the last building( it always haas an ocean View)
     - Track the maximum height encountered so far as you traverse
     - Add the current building to the result if its height is greater than the maximum heught encounetered.
  2. Reverse the Result
     - Since we’re traversing from right to left, reverse the result at the end to get indices in ascending order.
 
    •    Time Complexity: O(n), where n is the number of buildings.
    •    Space Complexity: O(n) for the result array (output space).
 */

public class OceanView {
    public init() { }
    
    public func findBuildings(_ heights: [Int]) -> [Int] {
        var result = [Int]()
        var maxSoFar = 0
        
        for i in stride(from: heights.count - 1, through: 0 , by : -1) {
            if heights[i] > maxSoFar {
                result.append(i)
                maxSoFar = heights[i]
            }
        }
        
        return result.reversed()
    }
}

/*
    Example 1:
    Input: heights = [4,2,3,1]
    Output: [0,2,3]
    Explanation: Building 1 (0-indexed) does not have an ocean view because building 2 is taller.
    
    Example 2:
    Input: heights = [4,3,2,1]
    Output: [0,1,2,3]
    Explanation: All the buildings have an ocean view.
 
    Example 3:
    Input: heights = [1,3,2,4]
    Output: [3]
    Explanation: Only building 3 has an ocean view.
*/

