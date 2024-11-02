//
//  InvertBinaryTree.swift
//  
//
//  Created by Rani Badri on 11/1/24.
//

/*
 
 */

public class InvertBinaryTree {
    public init() { }
    
    public func invertTree(_ root: Tree?) -> Tree? {
        guard let root else { return nil }
        
        var temp = root.left
        root.left = root.right
        root.right = temp
        
        // Recursively iterate left and right trees
        invertTree(root.left)
        invertTree(root.right)
        
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
