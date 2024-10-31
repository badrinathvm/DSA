//
//  SortArrayByParity.swift
//  
//
//  Created by Rani Badri on 10/28/24.
//

public class SortArrayByParity {
    public init() {
        
    }
    
    public func sortArrayByParity(_ arr: [Int]) -> [Int] {
        let even = arr.filter { $0.isMultiple(of: 2) }
            .sorted()
        let odd = arr.filter { !$0.isMultiple(of: 2) }.sorted()
        return even + odd
    }
    
    /*
     Time Compelxity : O(N)
     Space Compelxity: O(1)
    */
    
    public func arrayParitySort(_ arr: [Int]) -> [Int] {
        var nums = arr // Mutable copy
        var left = 0 , right = nums.count - 1
        while left < right {
            if nums[left] % 2 > nums[right] % 2 {
                // Swap if left is odd amd right is even
                nums.swapAt(left, right)
            }
            
            if nums[left] % 2 == 0{
                left += 1
            }
            
            if nums[right] % 2 == 1  {
                right -= 1
            }
        }
        
        return nums
    }
}

/*
     
Input :  [3, 1, 2, 4]
     
Output: [4,3,1,3]
     
*/
