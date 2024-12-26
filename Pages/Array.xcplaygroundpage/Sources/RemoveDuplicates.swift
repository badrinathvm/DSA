//
//  RemoveDuplicates.swift
//  
//
//  Created by Rani Badri on 12/25/24.
//

public class RemoveDuplicates {
    public init() { }
    
    public func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        // Pointer for the position of the last unique element
        var slow = 0
        
        // Iterate through the array starting from the second element
        for fast in 1..<nums.count {
            if nums[fast] != nums[slow] {
                // Move the slow pointer
                slow += 1
                // Place the unique element in the correct position
                nums[slow] = nums[fast]
            }
        }
        
        return slow + 1
    }
}

/*
  Input : [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
 
  Output:
 
  Unique Count: 5
  Modified Array: [0, 1, 2, 3, 4]
 
*/
