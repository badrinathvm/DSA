//
//  BoundaryBinaryTree.swift
//  
//
//  Created by Rani Badri on 12/27/24.
//
import Foundation

/*
  Time Complexity: O(n)
 
 Thus, the total time complexity is:
 O(h) + O(n) + O(h) = O(n)

  Space Complexity : O(n)
 
 Thus, the total space complexity is:
 O(h) + O(n) + O(h) = O(n)

 */

public class BoundaryBinaryTree {
    public init() { }
    
    public func boundaryOfBinaryTree(_ root: Tree?) -> [Int] {
        guard let root = root else { return [] }
        var boundary = [Int]()
        
        func isLeaf(_ node: Tree?) -> Bool {
            return node?.left == nil && node?.right  == nil
        }
        
        // Add the Left boundary
        func addLeftBoundary(_ node: Tree?) {
            var current = node
            while current != nil  {
                if !isLeaf(current) {
                    boundary.append(current!.value)
                }
                current = current?.left ?? current?.right
            }
        }
        
        // Add the Leaves
        func addLeaves(_ node: Tree?) {
            guard let node = node else { return }
            if isLeaf(node) {
                boundary.append(node.value)
                return
            }
            addLeaves(node.left)
            addLeaves(node.right)
        }
        
        // Add the right boundary
        func addRightBoundary(_ node: Tree?) {
            var current = node
            var stack = [Int]()
            while current != nil {
                if !isLeaf(current) {
                    stack.append(current!.value)
                }
                current = current?.right ?? current?.left
            }
            boundary.append(contentsOf: stack.reversed())
        }
        
        
        // Add root if it is not a leaf
        if !isLeaf(root) {
            boundary.append(root.value)
        }
        addLeftBoundary(root.left)
        addLeaves(root)
        addRightBoundary(root.right)
        return boundary
    }
}


/*
 
  Input:
      1
       \
         2
        / \
       3   4
 
 
 Output:  [1,3,4,2]
 
 */
