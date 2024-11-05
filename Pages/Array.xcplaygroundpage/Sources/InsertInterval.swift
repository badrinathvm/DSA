//
//  InsertInterval.swift
//  
//
//  Created by Rani Badri on 10/12/24.
//

public class InsertInterval {
    public init() {
        
    }
    
    public static func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard !intervals.isEmpty else { return [newInterval] }
        // combine the newInterval to intervals
        var _intervals = intervals
        _intervals.append(newInterval)
        
        let sortedIntervals = _intervals.sorted { $0[0] < $1[0] }
        var output = [sortedIntervals[0]]
        
        print(sortedIntervals) // [[1, 3], [2, 5], [6, 9]]
        
        for interval in sortedIntervals[1...] {
            let start = interval[0] // 2
            let end = interval[1]   // 5
            let lastEnd = output.last![1] // 3
            
            if start <= lastEnd {  // 2 <= 3
                output[output.count - 1][1] = max(lastEnd, end) // max(3, 5) = 5
            } else {
                output.append(interval)
            }
        }
        
        return output
    }
}

// Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
// Output: [[1,5],[6,9]]
