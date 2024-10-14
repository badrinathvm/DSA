//
//  BibaryTreeRightSideView.swift
//  
//
//  Created by Rani Badri on 10/14/24.
//

// Time Complexity - O(N) , Space Complexity - O(N)
public class BinaryTreeRightSideView {
    public static func rightSideView(_ root: Tree?) -> [Int] {
        guard let root else { return [] }
        var result = [Int]()
        
        var queue = Queue<Tree>()
        queue.push(root)
        
        while !queue.empty() {
 
            // get the lkevel count
            let levelCount = queue.arr.count
            var lastNodeValue: Int?
            
            for i in 0..<levelCount {
                // get the front node
                let node = queue.front
                
                _ = queue.pop()
                
                lastNodeValue = node.value
                
                if let left = node.left {
                    queue.push(left)
                }
                
                if let right = node.right {
                    queue.push(right)
                }
            }
            
            if let last = lastNodeValue {
                result.append(last)
            }
        }
        
        return result
    }
}
