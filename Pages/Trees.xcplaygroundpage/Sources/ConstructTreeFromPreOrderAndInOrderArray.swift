//
//  ConstructTreeFromPreOrderAndInOrderArray.swift
//  
//
//  Created by Rani Badri on 10/24/24.
//

/*
   Approach
 
   1. The first element in preOrder array will bethe root element
   2. Find the index of the root element in the inOrder array.
          This index splits the inOrder array in to left and right sub trees.
   3.Recusrively repeat the procress to build the left and right sub trees.
 */

/*
   Time Complexity: O(n), where n is the number of nodes in the tree. We process each node once to build the tree.
   Space Complexity: O(n) due to the recursion stack and the space used to store the inorderIndexMap.
 */
public class ConstructTreeFromPreOrderAndInOrderArray {
    public init() { }
    
    public func buildTree(_ preOrder: [Int], _ inOrder: [Int]) -> Tree? {
        // Dictionary to store the indexes
        var inOrderIndexMap: [Int: Int] = [:]
        for (index, value) in inOrder.enumerated() {
            inOrderIndexMap[value] = index
        }
        
         func arrayHelper(
            _ preOrder: [Int],
            _ preOrderStart: Int,
            _ preOrderEnd: Int ,
            _ inOrderStart: Int,
            _ inOrderEnd: Int
        ) -> Tree? {
            // Base condition
            if preOrderStart > preOrderEnd || inOrderStart > inOrderEnd {
                return nil
            }
            
            // Root element
            let rootValue = preOrder[preOrderStart]
            let root = Tree(value: rootValue)
            
            // Identify the left and right sub trees
            let inOrderIndex = inOrderIndexMap[rootValue]!
            let leftTreeSize = inOrderIndex - inOrderStart
            
            root.left = arrayHelper(preOrder, preOrderStart + 1, preOrderStart + leftTreeSize, inOrderStart, inOrderIndex - 1)
            root.right = arrayHelper(preOrder, preOrderStart + leftTreeSize + 1, preOrderEnd, inOrderIndex + 1, inOrderEnd)
            
            return root
        }
        
        // call the helper with boundaries
        return arrayHelper(preOrder, 0, preOrder.count - 1, 0, inOrder.count - 1)
    }
}


/**
 
 
 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 
 
 */
