//
//  DiameterBinaryTree.swift
//  
//
//  Created by Rani Badri on 11/1/24.
//

/*
   Approach :
       Longest path of tree including the root
       calculate the height at each node both left and right
       Take the max(diameter, leftHeight+ rightHeight)
 
  Time Compelxity : O(N) - Where N is the number of nodes
  Space Complexity : O(H) - Where H is the height of the tree , In worst case it will be O(N) , and in the best case(balanced tree) it would be O(NlogN) due to recusrion stack
 */

public class DiameterBinaryTree {
    public init() {
    }
    
    public func diameterOfBinaryTree(_ root: Tree?) -> Int {
        var diameter = 0
        
        func height(_ root: Tree?) -> Int {
            guard let root else { return 0 }
            
            let leftHeight = height(root.left)
            let rightHeight = height(root.right)
            
            diameter = max(diameter, leftHeight + rightHeight)
            
            return max(leftHeight, rightHeight) + 1
        }
        
        _ = height(root)
        
        return diameter
    }
}

/*
 Input:
 
        1
       / \
      2   3
     / \
    4   5

 Output: 3
 
 */
