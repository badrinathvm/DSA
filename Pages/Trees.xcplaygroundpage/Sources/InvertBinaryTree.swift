//
//  InvertBinaryTree.swift
//  
//
//  Created by Rani Badri on 11/1/24.
//

/*
   Time Complexity : O(N) - where N is the number of nodes in the tree
   Space Complexity : O(H) - where H is the height of the tree, O(N) in the worst case and O(logN) for a balanced tree.
 */

public class InvertBinaryTree {
    public init() { }
    
    public func invertTree(_ root: Tree?) -> Tree? {
        guard let root else { return nil }
        
        let temp = root.left
        root.left = root.right
        root.right = temp
        
        // Recursively iterate left and right trees
        _ = invertTree(root.left)
        _ = invertTree(root.right)
        
        return root
    }
}


/*
 
Input:
 
  4
 / \
 2   7
 
Output :
 
  4
 / \
7   2
 
*/
