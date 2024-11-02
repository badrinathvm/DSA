//
//  FlattenTree.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/*
Approach:
 Step 1: We will be using reverse Post order traversal ( right -> left -> root)
 Step 2: Set its right child to the last processed node.
 Step 3: Set its left child to nil.
 Step 4: Move to the left child (reversing the pre-order traversal).
 
 Time Complexity: O(N) where N is the number of Nodes
 Space Complexity: O(H) , where H is th height of the tree , In the worst case it could be O(N) for skweed tree, For balanced tree O(NlogN)
 */

public class FlattenTree {
    public init() {
    }
    
    public func flatten(_ root: Tree?) {
        var lastProcessed: Tree?
        
        func flattenHelper(_ node: Tree?) {
            guard let node else { return }
            
            flattenHelper(node.right)
            flattenHelper(node.left)
            
            // Set the current node's right child to the last processed node
            node.right = lastProcessed
            node.left = nil // Ensure the left child is null
            lastProcessed = node // Update the last processed node
        }
        
        flattenHelper(root)
    }
}

/*
 
 Input :
   1
  / \
 2   5
/ \   \
3   4   6
 
Output:
 
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
 */
