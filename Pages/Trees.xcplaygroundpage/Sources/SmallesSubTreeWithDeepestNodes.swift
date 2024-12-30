//
//  SmallesSubTreeWithDeepestNodes.swift
//  
//
//  Created by Rani Badri on 12/30/24.
//

/*
  Approach:
   1. Post Order Traversal
     Start from the bottom of the tree and work upwards
     Compare the depth of the left and right sub trees
     If the depths are same, the current nide is the root if the smallest sub tree containing all deepest nodes
     Other wise , choose the subtree (left or right) withe the greater depth
 
 Time Complexity: O(n)
 Space Complexity: O(h)
 
 */

public class SmallesSubTreeWithDeepestNodes {
    public init() {
        
    }
    
    public func subTreeWithAllDeepest(_ root: Tree?) -> Tree? {
        
        func dfs(_ node: Tree?) -> (Int, Tree?) {
            // Base case: If the node is nil, return depth 0 and nil as
            guard let node = node else { return (0, nil)}
            
            // doing post order traversal
            // Recursively compute depth and subtree for left and right children
            let (leftDepth, leftNode) = dfs(node.left)
            let (rightDepth, rightNode) = dfs(node.right)
            
            // If both depths are the same, the current node is the root of the smallest subtree
            if leftDepth == rightDepth {
                return (leftDepth + 1, node)
            }
            
            if leftDepth > rightDepth {
                return (leftDepth + 1, leftNode)
            } else {
                return (rightDepth + 1, rightNode)
            }
        }
       
        // Start DFS from the root and return the subtree node
        return dfs(root).1
    }
}

/*
 
     3
    / \
   5   1
  / \   \
 6   2   8
    / \
    7   4
 
   2
 /   \
7     4

 */
