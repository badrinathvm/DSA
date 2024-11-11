//
//  BinaryTreeCamera.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//

/*
  Approach:
    Perform Post order traversal
    Define three states 0: Node needs a camera, 1: Node has a camera, 2: Node is covered by Camera
   
    Time Complexity : O(n) - where n is the number of nodes in the tree
    Space Complexity: O(h) - where h is the height of the tree
 */

public class BinaryTreeCamera {
    public init() { }
    
    public func minCameraCover(_ root: Tree?) -> Int {
        var cameraCount  = 0
    
        func dfs(_ node: Tree?) -> Int {
            // Base case, Null nodes are considered covered
            if node == nil { return 2 }
            
            // post order traversal
            let left = dfs(node?.left)
            let right = dfs(node?.right)
            
            // if any child nodes are '0' then it needs a camera on the current node
            if left == 0 || right == 0 {
                cameraCount += 1
                return 1
            }
            
            // if either of the child has camera, then return 2
            if left == 1 || right == 1 { return 2 }
            
            // If children are covered and dont have camera, the current node needs a camera.
            return 0
        }
        
        if dfs(root) == 0 {
            cameraCount += 1
        }
        
        return cameraCount
    }
}
