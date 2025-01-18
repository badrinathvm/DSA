//
//  LowestCommonAncestor.swift
//  
//
//  Created by Rani Badri on 11/4/24.
//

/*
 The Lowest Common Ancestor (LCA) of two nodes p and q in a binary tree is the deepest node that is an ancestor of both p and q. In other words:
     •    It is the lowest node in the tree such that both p and q are its descendants.
     •    A node is considered a descendant of itself, so the LCA can be one of the nodes themselves if it is an ancestor of the other.
 
 •    Time Complexity: O(n), where n is the number of nodes in the binary tree.
 •    Space Complexity:
        •  O(\log n) for a balanced binary tree.
        •  O(n) for a skewed binary tree.
 */

public class LowestCommonAncestor {
    public init() {}
    
    public func lca(_ root: Tree?, _ p: Tree?, _ q: Tree?) -> Tree? {
        // Base Condition: if root is nil, or root is one of p or q, return root
        if root == nil || root == p || root == q {
            return root
        }
        
        let leftLCA = lca(root?.left, p, q)
        let rightLCA = lca(root?.right, p, q)
        
        if leftLCA != nil && rightLCA != nil {
            return root
        }
        
        return leftLCA != nil ? leftLCA : rightLCA
    }
}


/*
         3
       /   \
      5     1
    /  \    / \
   6    2  0   8
       / \
      7   4
 
 
 Output:  LCAS of (4,6)  = 5 
 
 */
