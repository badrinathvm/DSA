//
//  MinSizeSubArraySum.swift
//  
//
//  Created by Rani Badri on 12/25/24.
//

public class MinSubArrayLen {
    public init() { }
    
    public func minSizeSubArrayLen(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var currentSum = 0
        var end = nums.count - 1
        var minLength = Int.max
        
        for end in 0..<nums.count {
            currentSum += nums[end]
            
            // Shrink the window while the condition is met
            while currentSum >= target {
                minLength = min(minLength, end - start + 1)
                currentSum -= nums[start]
                start += 1
            }
        }
        
        return minLength == Int.max ? 0 : minLength
    }
}

/*
 
 Input :
 nums : [2, 3, 1, 2, 4, 3]
 target : 7
 
 Output
 
 Minimal Subarray Length: 2
 The subarray [4, 3] has a sum of 7 and a length of 2, which is the minimal length.
 
 */
