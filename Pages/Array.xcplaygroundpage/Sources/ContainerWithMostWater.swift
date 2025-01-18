//
//  ContainerWithMostWater.swift
//  
//
//  Created by Rani Badri on 12/25/24.
//

/*
 
 The container formed by the lines at indices 1 and 8 (height[1] = 8 and height[8] = 7) holds the most water.
     •    The width is 8 - 1 = 7, and the height is min(8, 7) = 7.
     •    The area is 7 * 7 = 49.
 
 */

public class ContainerWithMostWater {
    public init() {
        
    }
    
    // Two pointer approach
    public func containerWithMostWater(_ heights: [Int]) -> Int {
        var left = 0
        var right = heights.count - 1
        var maxArea = 0
        
        while left < right {
            // Calculate the area of the current container
            let currentHeight = min(heights[left], heights[right]) // min(1, 8) = 1
            let currentWidth = right - left // 8 - 1 // 7
            let currentArea = currentHeight * currentWidth // 1 * 7
            
            maxArea = max(maxArea, currentArea)
            
            // Move the pointer pointing to the shorter line
            if heights[left] < heights[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
}


/*
 
 Input :
   [1,8,6,2,5,4,8,3,7]
 
 Output: 49
 
 */
