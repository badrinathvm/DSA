//
//  DotProductSparseVectors.swift
//  
//
//  Created by Rani Badri on 12/31/24.
//

/*
  Time Complexity: O(n + k)
    •    Initialization:  O(n) , where  n  is the length of the vector (to create the dictionary).
    •    Dot Product:  O(k), where  k  is the number of non-zero elements (iterate over one dictionary and lookup in the other, which is  O(1)  per lookup).
  
 Space Complexity: O(k)
    •    Initialization:  O(k) , where  k  is the number of non-zero elements (for storing the dictionary).
    •    Dot Product:  O(1)  additional space.
 
 */

public class SparseVector {
    private var nonZeroElements: [Int: Int]
    
    public init(_ nums: [Int]) {
        self.nonZeroElements = [:]
        for (index, value) in nums.enumerated() {
            self.nonZeroElements[index] = value
        }
    }
    
    public func dotProduct(_ vec: SparseVector) -> Int {
        var result = 0
        let otherElements = vec.nonZeroElements
        
        // Iterate over the smaller dictionary for efficiency
        if nonZeroElements.count <= otherElements.count {
            for (index, value) in nonZeroElements {
                if let otherValue = otherElements[index] {
                    result += value * otherValue
                }
            }
        } else {
            for (index, value) in otherElements {
                if let otherValue = nonZeroElements[index] {
                    result += value * otherValue
                }
            }
        }
        return result
    }
}

/*
 
 Input: nums1 = [1,0,0,2,3], nums2 = [0,3,0,4,0]
 Output: 8
 
 Explanation: v1 = SparseVector(nums1) , v2 = SparseVector(nums2)
 v1.dotProduct(v2) = 1*0 + 0*3 + 0*0 + 2*4 + 3*0 = 8
 
 */
