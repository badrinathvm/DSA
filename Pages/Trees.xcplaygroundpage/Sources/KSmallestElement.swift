//
//  KSmallestElement.swift
//  
//
//  Created by Rani Badri on 10/20/24.
//

// Time Complexity - O(N)
// Space Complexit - O(N)
public class KSmallestElement {
    static var count = 0
    static var result = 0
    public init() { }
    public static func kthSmallest(_ root: Tree?, _ k: Int) -> Int {
        inOrder(root, k)
        return result
    }
    
    static func inOrder(_ node: Tree?, _ k: Int) {
        guard let node else { return }
        
        // visit the left subtree
        inOrder(node.left, k)
        
        // Increment count and check if current node is the kth element
        count += 1
        if count == k {
            result = node.value
            return
        }
        
        inOrder(node.right, k)
    }
}
