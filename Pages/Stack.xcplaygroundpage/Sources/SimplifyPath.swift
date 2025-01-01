//
//  SimplifyPath.swift
//  
//
//  Created by Rani Badri on 12/30/24.
//

/*
 
 The strategy is to use a stack to keep track of valid directories as we process the path
 Time complexity :O(n)
 Space Complexity : O(n)
 */

public class SimplifyPath {
    public init() { }
    
    public func simplifyPath(_ path: String) -> String {
        var stack = [String]()
        let components = path.split(separator: "/")
        
        for component in components {
            if component == "" || component == "." {
                // Ignore empty components (for extra slashes) or current directory (.)
                continue
            }
            
            if component == ".." {
                // Go up one level (pop from the stack) if the stack is not empty
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                // Otherwise, push the component to the stack
                stack.append(String(component))
            }
        }
        
        // Join the stack into a simplified path
        return "/" + stack.joined(separator: "/")
    }
}


/*
 
 Input: path = "/home//foo/"

 Output: "/home/foo"

 Explanation:

 Multiple consecutive slashes are replaced by a single one.
 
 
 Input:  /home/../usr//bin/./test
 
 Output: /usr/bin/test"
 
 */
