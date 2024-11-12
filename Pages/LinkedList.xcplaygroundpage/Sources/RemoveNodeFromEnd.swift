//
//  RemoveNodeFromEnd.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/*
 Time Complexity : O(N)
 Space Complexity: O(1)
*/

public class RemoveNodeFromEnd {
    public init() {
        
    }
    
    public func removeNodeFromEnd(_ head: LinkedList?, _ k : Int) -> LinkedList? {
        guard let head else { return nil }
        
        let dummy = LinkedList(value: 0)
        dummy.link = head
        var first: LinkedList? = dummy
        var second: LinkedList? = dummy
        
        var counter = 0
        
        while counter < k {
            second = second?.link
            counter += 1
        }
        
        while second?.link != nil {
            first = first?.link
            second = second?.link
        }
        
        first?.link = first?.link?.link
        
        return dummy.link
    }
}

/*
 
 Input:
 1---> 2---> 3---> 4 --> 5,  k = 2
 Output:
 1---> 2---> 3---> 5

 */
