//
//  DeleteNodeLinkedList.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/*
  Time Complexity: O(n) - each node is visited once
  Space Complexity: O(1)
 
 */

public class DeleteNodeLinkedList {
    public init() {
        
    }
    
    public func deleteNode(_ head: LinkedList?, _ k : Int) -> LinkedList? {
        guard let head else { return nil }
        // Create a dummy node to handle edge cases such as deleting the head
        let dummy = LinkedList(value: 0)
        dummy.link = head
        
        var prev : LinkedList? = dummy
        var cur: LinkedList? = head
        
        while cur != nil {
            if cur?.value == k {
                // Skip the node with value k
                prev?.link = cur?.link
            } else {
                prev = cur
            }
            cur = cur?.link
        }
        
        return dummy.link
    }
    
    func deleteNode(_ node: LinkedList?) {
        // Make sure node and node's next are not nil
        guard let node = node, let next = node.link else { return }
        
        // Copy the next node's value to the current node
        node.value = next.value
        
        // Skip the next node
        node.link = next.link
    }
}

/*
 Input : 4 --> 5 --> 1 --> 9 k = 5
 Output : 4 --> 1 --> 9
 */
