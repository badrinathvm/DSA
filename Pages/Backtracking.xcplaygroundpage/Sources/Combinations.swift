//
//  Untitled.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/*
  Time Complexity : O(C(n,k)), where C(n,k) is the number of ways to choose k elements from
  Space Complexity: O(k)
 
 */

public class Combinations {
    public init() {}

    public func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var results = [[Int]]()
        var combination = [Int]()
        
        func backtrack(_ start: Int) {
            if combination.count == k {
                results.append(combination)
                return
            }
            
            // Start from 'start' to ensure no duplicates and ascending order
            for i in start..<n+1 {
                combination.append(i)
                backtrack(i+1) // Move to the next element
                combination.removeLast() // Backtrack by removing last element
            }
        }
        
        backtrack(1)
        return results
    }
}

/*
 Input :  n = 4 , k = 2
 Output : [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
 
 */

