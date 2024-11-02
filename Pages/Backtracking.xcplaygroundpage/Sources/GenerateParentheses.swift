//
//  GenerateParentheses.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//



/*
 Time Complexity: O(4^n / sqrt(n) ) which is efficient govent he branching factor and depth.
 Space Complexity: O(4^n / sqrt(n) ) for the results array and O(n) for the recursive stack depth.
 */

public class GenerateParentheses {
    public init() {}
    
    public func generateParentheses(_ n: Int) -> [String] {
        var results = [String]()
        
        func backtrack(_ current: String, _ open: Int, _ close: Int) {
            // Base condition
            if current.count == 2 * n {
                results.append(current)
                return
            }
            
            // if we can add an opening parenthesis, add it
            if open < n {
                backtrack(current + "(", open + 1, close)
            }
            
            if close < open {
                backtrack(current + ")", open, close + 1)
            }
        }
        
        backtrack("", 0, 0)
        return results
    }
}

/*
 
 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 
 */
