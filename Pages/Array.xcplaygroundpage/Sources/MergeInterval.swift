//
//  MergeInterval.swift
//  
//
//  Created by Rani Badri on 10/12/24.
//

import Foundation

// Time Complexity - O(nlogn)

public class MergeInterval {
    public init() { }
    
    public static func merge( _ intervals: [[Int]]) -> [[Int]] {
        // Edge case: if the list is empty, return an empty list
        guard !intervals.isEmpty else { return [[]] }
        
        // Step 1: Sort the intervals by the start time
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        
        var output = [ sortedIntervals[0] ]
        
        // Step 2: Iterate through the sorted intervals and merge overlapping ones
        for interval in sortedIntervals[1...] {
            let lastEnd = output.last![1] // 3
            let start = interval[0] // 2
            let end = interval[1] // 6
            
            // Check if the current interval overlaps with the last interval in output
            if start <= lastEnd {  // 2<=3 then choose the max of both the ends max(3, 6)
                output[output.count - 1][1] = max(end, lastEnd)
            } else {
                output.append(interval)
            }
        }
        return output
    }
}


// Input :  [[1,3],[2,6],[8,10],[15,18]]

// output: [[1,6],[8,10],[15,18]]
