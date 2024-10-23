//
//  SearchSortedArray.swift
//  
//
//  Created by Rani Badri on 10/19/24.
//
import Foundation

// Time Complexity - O(log n)
public class SearchSortedArray {
    
    public init() {}
    
    public static func search(nums: [Int], target: Int) -> Int {
        var left = 0, right = nums.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            // if the target is at the middle
            if nums[mid] == target {
                return mid
            }
            
            // check if left side is sorted
            if nums[left] <= nums[mid] {
                // Target is within the sorted left half
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                } else { // Target is in the unsorted right half
                    left = mid + 1
                }
            } // Otherwise, the right side is sorted
            else {
                // Target is within the sorted right half
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else { // Target is in the unsorted left half
                    right = mid - 1
                }
            }
        }
        
        return -1
    }
}
