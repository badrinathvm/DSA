//
//  TowSum.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/*
 Approach:
   Step 1: Have a dictionary of element and the index
   Step 2: Iterate over the nums.enumerated() array by gettign the (index, element)
   Step 3:  Calculate the potential number = dict [target - element]
   Step 4 : check if the potential number eexists in the dictionary
   Step 5 : IF yes returm the array [result, index] else add it the dictionary dict[element] = index
 
   Time Compexity : `O(n)`, where 'n' is the number of elememts in `nums` array
   Space Complexity: `O(n)`, where 'n' is the number of elememts in `nums` array
*/

public class TwoSum {
    public init() {
        
    }
    
    public func twoSum(nums: [Int], target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (index, element) in nums.enumerated() {
            let potemtialNumber = target - element
            if let potentialIndex = dict[potemtialNumber] {
                return [potentialIndex, index]
            } else {
                dict[element] = index
            }
        }
        return []
    }
}

/*
 Input: [2,7,11,15], target = 9
 Output: [0,1]
 */