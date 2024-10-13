//
//  IntervalListInteraction.swift
//  
//
//  Created by Rani Badri on 10/12/24.
//

// Time Complexity - O(m + n)
// Space Complexity - O(
public class IntervalListInteraction {
    
    public init() { }
    
    public static func intervalIntersection( _ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var i = 0 , j = 0
        var result = [[Int]]()
        while i < firstList.count && j < secondList.count {
            // Use zip to consider pairs of intervals
            let (start1, end1) = (firstList[i][0], firstList[i][1])
            let (start2, end2) = (secondList[j][0], secondList[j][1])
            
            // Calculate the intersection
            let startMax = max(start1, start2)
            let endMin = min(end1, end2)
            
            // If there's an overlap, append the intersection
            if startMax <= endMin {
                result.append([startMax, endMin])
            }
            
            if end1 < end2 {
                i += 1
            } else {
                j += 1
            }
        }
        return result
    }
}
