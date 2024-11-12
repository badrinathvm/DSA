//
//  MaximumConsecutiveOnes.swift
//  
//
//  Created by Rani Badri on 11/4/24.
//

public class MaximumConsecutiveOnes {
    public init() {}
    
    public func maxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxCount = 0
        var currentCount = 0
        
        for num in nums {
            if num == 1 {
                currentCount += 1
                maxCount = max(maxCount, currentCount)
            } else {
                currentCount = 0
            }
        }
        
        return maxCount
    }
}

/*
 
 Input:
  nums: [1, 1, 0, 1, 1, 1]
 Output: 3
 
 */
