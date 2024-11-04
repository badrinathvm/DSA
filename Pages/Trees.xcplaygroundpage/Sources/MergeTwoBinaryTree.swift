//
//  MergeTwoBinaryTree.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

public class MergeTwoBinaryTree {
    public init() {
        
    }
    
    public func mergeTwoBinaryTree(_ root1: Tree?, _ root2: Tree?) -> Tree? {
        // If either of the roots is nil, return the other tree
        guard let root1 else { return root2 }
        guard let root2 else { return root1 }
        
        // Create a new tree node by summing the values of the two nodes
        let mergedRoot = Tree(value: root1.value + root2.value)
        
        // Recursively merge the left and right subtrees
        mergedRoot.left = mergeTwoBinaryTree(root1.left, root2.left)
        mergedRoot.right = mergeTwoBinaryTree(root1.right, root2.right)
        
        return mergedRoot
    }
    
    public static func printTree(_ root: Tree?, level: Int = 0) {
        guard let root = root else { return }
        
        // Print the current node with indentation to represent levels
        let indent = String(repeating: "  ", count: level)
        print("\(indent)\(root.value)")
        
        // Traverse the left and right children with increased indentation
        if root.left != nil || root.right != nil { // Only print children if they exist
            printTree(root.left, level: level + 1)
            printTree(root.right, level: level + 1)
        }
    }
}
