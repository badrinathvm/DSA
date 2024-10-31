//
//  IncreasingOrderBST.swift
//  
//
//  Created by Rani Badri on 10/28/24.
//

/**
  Time Compelxity : O(N)
  Space Compelcity :  O(N)
 */

public class IncreasingOrderBST {
    public init() {
        
    }
    
    public func increasingOrderBST(_ root: Tree?) -> Tree? {
        guard let root = root else { return nil }
        // get the inorder traversal of the tree
        let inOrderResult = inorderTraversal(root)
        
        let tree = Tree(value: inOrderResult[0])
        var current = tree // Maintain the reference for the current node
        
        for element in inOrderResult[1...] {
            let newNode = Tree(value: element)
            current.right = newNode // Link new node to the current's right
            current = newNode // Move the reference to the newly created node
        }
        
        return tree
    }
    
    func inorderTraversal(_ root: Tree) -> [Int] {
        var result: [Int] = []
        
        if let left = root.left {
            result +=  inorderTraversal(left)
        }
        
        result.append(root.value)
        
        if let right = root.right {
            result += inorderTraversal(right)
        }
        
        return result
    }
}
