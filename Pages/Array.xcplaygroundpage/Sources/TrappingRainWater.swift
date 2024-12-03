//
//  TrappingRainWater.swift
//  
//
//  Created by Rani Badri on 12/3/24.
//

public class TrappingRainWater {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        
        var leftTower = Array(repeating: 0, count: height.count)
        var rightTower = Array(repeating: 0, count: height.count)
        
        var leftMax = 0
        for i in 0..<height.count {
            leftMax = max(leftMax, height[i])
            leftTower[i] = leftMax
        }
        
        var rightMax = 0
        for i in stride(from: height.count - 1, through: 0, by: -1) {
            rightMax = max(rightMax, height[i])
            rightTower[i] = rightMax
        }
        
        var res = 0
        for i in 0..<height.count {
            res += min(leftTower[i], rightTower[i]) - height[i]
        }
        
        return res
    }
}

/*
 
  Input: [0,1,0,2,1,0,1,3,2,1,2,1]
  Output: 6
 
 
 */

