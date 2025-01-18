//
//  DailyTemperatures.swift
//  
//
//  Created by Rani Badri on 12/22/24.
//

/*
 
  Approach:
 
 For each currentDay:
 
 1.    While the stack is not empty and the current temperature is greater than the temperature at the index stored at the top of the stack:
    •    Pop the index from the stack (let’s call it previousDay).
    •    Calculate the difference between the currentDay and the previousDay.
    •    Store the difference in the result array for previousDay.
 2. Push the currentDay onto the stack.
 
 After the traversal, any indices left in the stack represent days for which no warmer temperature exists. These days remain 0 in the result array (default value).
 
  Time Complexity : O(n)
  Space Complexity : O(n)
 */


public class DailyTemperatures {
    public init() { }
    
    public func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count) // Result array initialized with 0s
        var stack:[Int] = [] // Monotonic decreasing stack to store indices
        
        for currentDay in 0..<temperatures.count {
            // While stack is not empty and current temperature is greater than the temperature at the index stored in the stack
            while let last = stack.last, temperatures[currentDay] > temperatures[last] {
                let previousDay = stack.removeLast() // Pop the top of the stack
                result[previousDay] = currentDay - previousDay // Calculate the days difference
            }
            
            stack.append(currentDay)  // Push the current day index onto the stack
        }
        
        return result
    }
}


/*
 Input: temperatures = [73,74,75,71,69,72,76,73]
 
 Output: [1,1,4,2,1,1,0,0]
 
 */



