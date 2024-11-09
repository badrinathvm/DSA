//
//  EmployeeFreeTime.swift
//  
//
//  Created by Rani Badri on 11/4/24.
//

public class EmployeeFreeTime {
    public init() { }
    
    public func employeeFreeTime(schedule: [[(start: Int, end: Int)]]) -> [(Int,Int)] {
        var allIntervals = [(start: Int, end: Int)]()
        
        // Flatten the schedule list to a single list of intervals
        for intervals in schedule {
            allIntervals.append(contentsOf: intervals)
        }
        
        print(allIntervals)
        
        // sort the intervals by start time
        allIntervals.sort { $0.start < $1.start || ($0.start == $1.start && $0.end < $1.end) }
        
        var merged = [(start: Int, end: Int)]()
        merged.append(allIntervals[0])
        
        for schedule in allIntervals[1...] {
            let start = schedule.start // 5
            let end = schedule.end // 6
            let lastEnd = merged.last?.end ?? 0 // 2
            
            if start <= lastEnd {
                // There is an overlap; extend the end of the last interval
                merged[merged.count - 1].end = max(lastEnd, end)
            } else {
                // No overlap; add current interval to merged list
                merged.append(schedule)
            }
        }
        
        var freeTime = [(start: Int, end: Int)]()
        
        for index in 1..<merged.count {
            let prev = merged[index - 1]
            let current = merged[index]
            
            if prev.end < current.start {
                // The gap between the end of prev and start of curr is a free time interval
                freeTime.append((start: prev.end, end: current.start)) // just like (2,3) (4,6)
            }
        }
        
        return freeTime
    }
}

/*
 
 Input :
 
 schedule = [
     [(start: 1, end: 2), (start: 5, end: 6)],
     [(start: 1, end: 3)],
     [(start: 4, end: 10)]
 ]
 
 Output: [(3,4)]
 
 */

