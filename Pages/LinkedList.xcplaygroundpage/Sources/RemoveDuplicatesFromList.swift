//
//  RemoveDuplicatesFromList.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//
import Foundation

/*
  Time Complexity: O(n) , where n is the number of nodes
  Space Complexity: O(1)
 */

public class RemoveDuplicatesFromList {
    public init() {}
    
    public func removeDuplicates(_ head: LinkedList?) -> LinkedList? {
        guard let head else { return nil }
        
        var set = Set<Int>()
        var current: LinkedList? = head
        var previous: LinkedList?
        
        while let node = current {
            let value = node.value
            if set.contains(value) {
                previous?.link = current?.link
            } else {
                set.insert(value)
                previous = current
            }
            
            current = current?.link
        }
        return head
    }
}

/*
 Input : 1 --> 2 --> 2--> 3
 
 Output: 1 --> 2 --> 3
 
 */
