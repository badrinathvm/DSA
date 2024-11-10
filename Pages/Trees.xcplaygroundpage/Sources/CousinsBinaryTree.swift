//
//  Untitled.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//

/*
  Approach :
    Two nodes are cousins if they are ont he same level but differnt parents,
 
    Time Complexity : O(n) where n is the number of nodes
    Space Complexity : O(n) since queue might contain all nodes in the worst case
 */

public class CousinsBinaryTree {
    public init() {
        
    }
    
    public func isCousins(root: Tree?, x: Int, y: Int) -> Bool {
        guard let root else { return false }
        
        var queue:Queue<(node: Tree, parent:Tree?)> = Queue<(node: Tree, parent: Tree?)>()
        queue.push((node: root, parent: nil))
        
        while !queue.empty() {
            let levelSize = queue.arr.count
            var xParent: Tree? = nil
            var yParent: Tree? = nil
            
            for _ in 0..<levelSize {
                let (node, parent) = queue.front
                _ = queue.pop()
                
                if node.value == x {
                    xParent = parent
                }
                
                if node.value == y {
                    yParent = parent
                }
                
                // Add child nodes to the queue with the current node as their parent
                if let left = node.left {
                    queue.push((node: left, parent: node))
                }
                
                if let right = node.right {
                    queue.push((node: right, parent: node))
                }
            }
            
            // Check if both x and y are found at the same level
            if xParent != nil && yParent != nil {
                return xParent != yParent // They are cousins if parents are different
            }
            
            // If only one of x or y is found at the current level, they aren't cousins
            if (xParent != nil) != (yParent != nil) {
                return false
            }
        }
        
        return false
    }
}

/*

 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
     1
    /  \
   2    3
   \     \
    4     5
 
 Output: true
 
 
 */
