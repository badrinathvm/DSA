//
//  RemoveNodeFromLinkedList.swift
//  
//
//  Created by Rani Badri on 10/22/24.
//

//Remove every node which has a node with a greater value anywhere to the right side of it.

/*
    Approach:
    1. Reverse the linked List
    2. Traverse the list and compare value with next nodes, if the value is greater retain it else delete the node.
    3. Reverse the linked list back
 
 */

// Time Complexity: O(n), where n is the number of nodes in the linked list.
// Space Complexity: O(1), as we only use a constant amount of additional space.
public class RemoveNodeGreaterValueTowardsRight {
    
    public init() {
    }
    
    public func removeNodes(_ head: LinkedList?) -> LinkedList? {
        let reversedList = reverseLinkedList(head)
                
        var max = Int.min
        var prev:LinkedList? = nil
        var current = reversedList
        
        while current != nil {
            if current!.value >= max {
                max = current!.value
                prev = current
            } else {
                // skipping the node
                prev?.link = current?.link
            }
            current = current?.link
        }
        
        // revesr the list again
        let finalList = reverseLinkedList(reversedList)
        return finalList
    }
    
    func reverseLinkedList(_ head: LinkedList?) -> LinkedList? {
        var prev:LinkedList? = nil
        var cur:LinkedList? = head
        
        while cur != nil {
            let temp = cur?.link
            cur?.link = prev
            prev = cur
            cur = temp
        }
        
        return prev
    }
    
}


/*
 Input :  5 --> 2 --> 13 --> 3 --> 8
 
 Output: 13 --> 8 
 
 */
