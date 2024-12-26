//
//  RemoveElement.swift
//  
//
//  Created by Rani Badri on 12/25/24.
//

public class RemoveElement {
    public init() { }
    
    public func removeElement(_ nums: inout [Int], val: Int) -> Int {
        // Pointer to track the position for non-val elements
        var slow = 0
        for fast in 0..<nums.count {
            if nums[fast] != val {
                // Move the non-val element to the position tracked by slow
                nums[slow] = nums[fast]
                // Increment slow to point to the next position
                slow += 1
            }
        }
        // The number of elements not equal to val
        return slow
    }
}


/*
 Input :
 [3, 2, 2, 3]
 
 New Length: 2
 Modified Array: [2, 2]
 
 */
