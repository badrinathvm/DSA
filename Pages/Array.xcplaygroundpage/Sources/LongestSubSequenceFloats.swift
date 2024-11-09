//
//  LongestSubSequenceFloats.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//

/*
  Time Complexity :  O(n)
  Space Complexity:  O(n)
 */


public class LongestSubSequenceFloats {
    public init() {}
    
    public func longestSubSequence(withDifference limit: Double, for array: [Double]) -> [Double] {
        guard !array.isEmpty else { return [] }
        
        var longestSequence: [Double] = []
        var currentSequence: [Double] = [array[0]]
        
        for index in 1..<array.count {
            let difference = abs(array[index] - array[index - 1])
            if difference <= limit {
                currentSequence.append(array[index])
            } else {
                if currentSequence.count > longestSequence.count {
                    longestSequence = currentSequence
                }
                currentSequence = [array[index]]
            }
        }
        
        
        if currentSequence.count > longestSequence.count {
            longestSequence = currentSequence
        }
        
        return longestSequence
    }
}

/*
  Input: [2.1, 2.5, 3.4, 4.2, 5.1, 3.8, 2.9, 1.8, 0.5], withDifference: 1.0
  Output : [2.1, 2.5, 3.4, 4.2, 5.1]
 
 
 */
