//
//  PruneTree.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//

/*
  Time Complexity : O(n) - Where "n" is the nunber of the nodes in the tree
  Space Compelxity: O(h) - Where 'h' is the height of the tree
 */

public class PruneTree {
    public init() { }
    
    public func pruneTree(_ root: Tree?) -> Tree? {
        guard let node = root else { return nil }
        
        // Recursively prune the left and right subtrees
        node.left = pruneTree(node.left)
        node.right = pruneTree(node.right)
        
        // If the node is a leaf (no left or right children) and its value is 0, prune it
        if node.value == 0 && node.left == nil && node.right == nil {
            return nil
        }
        
        return node
    }
}

/*
 
Input
       1
      / \
     0   1
    / \   \
   0   0   1
 
Output
 
   1
    \
     1
      \
       1
 */
