//
//  SamTree.swift
//  
//
//  Created by Rani Badri on 10/31/24.
//

/**
  Time Compeliuty : O(N) , wher N is the number of nodes, each node is visited once
  Space Compelxity : O(H), H is the height of the ttree
 */

public class SameTree {
    public init() {
        
    }
    
    public func isSame(_ p : Tree? , _ q : Tree?) -> Bool {
        isSameHelper(p, q)
    }
    
    func isSameHelper(_ p : Tree? , _ q : Tree?) -> Bool {
        // If both nodes are nil, they are the same
        if p == nil && q == nil { return true }
        
        // if only one of them is nil then retune false
        if p == nil || q == nil { return false }
        
        guard let p = p , let q = q else {
            return false
        }
        
        return p.value == q.value &&
                isSameHelper(p.left, q.left)
                && isSameHelper(p.right, q.right)
    }
}


/*
 
Input :
 
    1                1
 /   \             /   \
 1     3         1      3

 Output: true
 
 */
