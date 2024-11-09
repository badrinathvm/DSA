//
//  CanConstruct.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//

/*
  Time Complexity :  O( m * n )  - where "m" is the lenght of the target string,  "n" is the lenght of the wordBank
  Dpac eCompelxity : O ( m * m ) - memoization storage , and recursive call stack
 
 */

public class CanConstruct {
    public init() { }
    
    public func canConstruct(_ target: String, _ wordBank: [String]) -> Bool {
        // Momization Dictionary
        var memo: [String: Bool] = [:]
        
        func canConstructHelper(_ target: String) -> Bool {
            // Base case: if the target is an empty string, it can be constructed by default
            if target.isEmpty { return true }
            
            // Check if we already know the result for this target
            if let result = memo[target] { return result }
            
            for word in wordBank {
                if target.hasPrefix(word) {
                    // get the suffix by removing the word prefix
                    let suffix = String(target.dropFirst(word.count))
                    
                    // Recusrively check if the suffix can be constructed
                    if canConstructHelper(suffix) {
                        memo[target] = true
                       // print("memo Isnide: \(memo)")
                        return true
                    }
                }
            }
            
            // If no construction is possible, store the result and return false
            memo[target] = false
           // print("memo Outside: \(memo)")
            return false
        }
        
        let result = canConstructHelper(target)
        return result
    }
}

/*
  Input:
   "abcdef", ["ab", "abc", "cd", "def", "abcd"]
 
  Output:
    true
 
 
 */
