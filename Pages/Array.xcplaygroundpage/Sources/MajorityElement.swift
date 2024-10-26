//
//  MajorityElement.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

/*
  Time Complexity : O(N)
  Space Complexity : O(N)
 
 */

public class MajorityElement {
    public init() {
        
    }
    
    public func majorityElement(_ nums: [Int]) -> Int {
        var count: [Int: Int] = [:]
        
        for num in nums {
            count[num, default: 0] += 1
            
            if count[num]! > nums.count / 2 {
                return num
            }
        }
        
        return -1
    }
}
