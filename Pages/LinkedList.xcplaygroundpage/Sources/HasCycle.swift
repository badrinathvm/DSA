//
//  HasCycle.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

// Time Complexity O(N)
// Space Complexity : O(1)

public class HasCycle {
    public init() {}
    
    public func hasCycle(_ head: LinkedList?) -> Bool {
        // Edge case: if the list is empty or has only one node without a cycle
        guard let head,  let _ = head.link else { return false }
        
        var slow: LinkedList? = head
        var fast: LinkedList? = head.link
        
        while fast != nil && fast?.link != nil {
            slow = slow?.link
            fast = fast?.link?.link
            
            if slow === fast {
                return true
            }
        }
        
        return false
    }
}

/**

  Input : 3 --> 2--> 0--> 4 (points to 3)
 
   Output: true
 */
