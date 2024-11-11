//
//  BalancedBinaryTree.swift
//  
//
//  Created by Rani Badri on 10/31/24.
//
/*
  Time Compelxity - O(N) - N is the number of nodes
  Space Compelxity - O(H)  - H is the height of the tree
 
 */
public class BalancedBinaryTree {
    public init() {
    }
    
    public func isBalanced(_ root: Tree?) -> Bool {
        return treeHeight(root) != -1
    }
    
    func treeHeight(_ node: Tree?) -> Int {
        guard let node = node else { return 0 }
        
        // Recusrively check the height of the left subtree
        let leftHeight = treeHeight(node.left)
        if leftHeight == -1 { return -1 } // Left sub tree is unabalanced.
        
        let rightHeight = treeHeight(node.right)
        if rightHeight == -1 { return -1 } // Right sub tree is unabalanced.
        
        // check if the current node is balanced
        if abs(leftHeight - rightHeight) > 1 { return -1 }
        
        return max(leftHeight, rightHeight) + 1
    }
}

/*
 
Input :
 
    1
   / \
  2   3
 / \   \
4   5   6

Output: True
 
Input :
     1
    / \
   2   3
  / \
 4   5
/
6

Output : False
 
 At Node 1, we detect that the height difference between the left and right subtrees is 2, which exceeds the allowed difference of 1
 
 
 */
