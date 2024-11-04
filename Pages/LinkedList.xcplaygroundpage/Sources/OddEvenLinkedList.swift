//
//  OddEvenLinkedList.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

public class OddEvenLinkedList {
    public init() { }
    
    public func oddleEvenList(_ head: LinkedList?) -> LinkedList? {
        guard let head else { return nil }
        var odd: LinkedList? = head
        var even: LinkedList? = head.link
        let evenHead: LinkedList? = even
        
        while even != nil && even?.link != nil {
            odd?.link = even?.link // Link the odd node to the next odd
            odd = odd?.link // Move the odd pointer forward
            
            even?.link = odd?.link // Link the even node to the next even
            even = even?.link
        }
        
        odd?.link = evenHead
        
        return head
    }
}

/*
 
 Input:
  1 --> 2 --> 3 --> 4 --> 5
 Output:
  1 --> 3--> 5--> 2 --> 4

 */
