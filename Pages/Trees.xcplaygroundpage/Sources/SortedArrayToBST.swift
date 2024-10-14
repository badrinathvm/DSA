//
//  SortedArrayToBST.swift
//  
//
//  Created by Rani Badri on 10/13/24.
//

// Time Complexity is O(n)
public class SortedArrayToBST {
    public static func sortedArrayToBST(_ nums: [Int]) -> Tree? {
        sortedBSTHelper(nums, 0, nums.count - 1)
    }
    
    // since it is sorted array , find the mid position of the array, the ones from 0..<mid  under the left side of the right and the ones from mid + 1 till end of the array falls under the right side of the Tree.
    static func sortedBSTHelper(_ nums: [Int], _ left: Int, _ right: Int) -> Tree? {
        guard left <= right else { return nil }
        
        let mid = (left + right) / 2
        let root = Tree(value: nums[mid])
        
        root.left = sortedBSTHelper(nums, left, mid - 1)
        
        root.right = sortedBSTHelper(nums, mid + 1, right)
        
        return root
    }
}
