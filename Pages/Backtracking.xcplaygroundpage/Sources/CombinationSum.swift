//
//  CombinationSum.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/*
Time Complexity : O(2^t) where t is the target
Space Complexity: O(t) for the recursion stack depth and O(2^t) for the results, especially in the cases with multiple valid combinations.
*/

public class CombinationSum {
    public init() {
        
    }
    
    public func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results = [[Int]]()
        var combination = [Int]()
        
        func backtrack(_ start: Int, _ currentSum: Int) {
            // Debug: Print current combination and sum
            print("Combination: \(combination), Current Sum: \(currentSum)")
                        
            // If the current sum equals target, add the current combination to results
            if currentSum == target {
                results.append(combination)
                return
            }
            
            for i in start..<candidates.count {
                let candidate = candidates[i]
                let newSum = currentSum + candidate
                
                // Only proceed if new sum is within target
                if newSum <= target {
                    combination.append(candidate) // Include candidate in the current combination
                    backtrack(i, newSum)          // Recurse with updated sum, allowing reuse of the candidate
                    combination.removeLast()      // Backtrack by removing last element
                }
            }
        }
        
        backtrack(0, 0)
        return results
    }
}

/*
 Input: candidates = [2,3,6,7], target = 7
 Output: [[2,2,3],[7]]
 Explanation:
 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
 7 is a candidate, and 7 = 7.
 These are the only two combinations.
 */

