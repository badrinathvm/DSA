//
//  SubarrayDiv.swift
//  
//
//  Created by Rani Badri on 10/14/24.
//

// Time Complexity - O(n) - traverse the array only once
// Space Complexity - O(n) - space required to store the dictionary

public class SubArrayDiv {
    
    public static func subArrayDivByK(_ arr: [Int], _ k: Int) -> Int {
        var prefixSum = 0
        var count = 0
        var modCount: [Int:Int] = [0:1]
        
        for nums in arr {
            prefixSum += nums
            
            var mod = (prefixSum % k  + k ) % k // handle negative modulus
            
            // If this mod has been seen before, it means there are subarrays ending here
            if let occurences = modCount[mod] {
                count += occurences
            }
            
            // update the mod count
            modCount[mod, default: 0] += 1
        }
        
        return count
    }
}
