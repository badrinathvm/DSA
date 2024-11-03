//
//  ReverseLinkedList.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

public class ReverseLinkedList {
    public init() {}
    
    public func reverse(_ head: LinkedList?) -> LinkedList? {
        var current: LinkedList? = head
        var previous: LinkedList?
        
        while current != nil {
            let temp = current?.link
            current?.link = previous
            previous = current
            current = temp
        }
        
        return previous
    }
}

/*
 
 Input : 10 --> 20 --> 30 --> 40
 
 Output: 40 --> 30 --> 20 --> 10
 
 */
