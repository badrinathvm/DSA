//
//  MinimumAbsDifference.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

/*
 
  Time Complexity - O(nlogn)
  Space Complexity - O(n)
 
 */
public class MiniminAbsDifference {
    public init() {
        
    }
    
    public func minimumAbsDifference(_ arr : [Int]) -> [[Int]] {
        // sort the array
        let sortedarray = arr.sorted()
        
        // Find the minimum Difference
        var minDiff = Int.max
        for i in 1..<sortedarray.count {
            minDiff = min(minDiff, sortedarray[i] - sortedarray[i-1])
        }
        
        // Find and collect all the pairs with absolute difference
        var result : [[Int]] = []
        for i in 1..<sortedarray.count {
            if sortedarray[i] - sortedarray[i-1] == minDiff {
                result.append([sortedarray[i], sortedarray[i-1]])
            }
        }
        
        return result
    }
    
    // functional programming approach
    public func minimumAbsDifference2(_ arr : [Int]) -> [[Int]] {
        //Step 1:  Sort the array
        let sortedArray = arr.sorted()
        
        // Step 2: Find the minimum absolute difference using map
        let differences = (1..<sortedArray.count).map { sortedArray[$0] - sortedArray[$0 - 1] }
        let minDifference = differences.min() ?? 0
        
        // Step 3: Filter and map to collect pairs with the minimum absolute difference
        let result = (1..<sortedArray.count)
            .filter { sortedArray[$0] - sortedArray[$0 - 1] == minDifference }
            .map{ [sortedArray[$0 - 1], sortedArray[$0]]}
        
        return result
    }
}


/*
 
 
 Input : arr = [4,2,1,3]

 Output : [[1,2],[2,3],[3,4]]


 */
