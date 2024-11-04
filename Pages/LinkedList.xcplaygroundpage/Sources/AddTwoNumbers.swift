//
//  AddTwoNumbers.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/*
  Time Complexity: O(max(m,n)) where m and n are the lenghts of the node1 and node2 respectively
  Space Complexity: O(max(m,n))
 */

public class AddTwoNumbers{
    public init() { }
    
    public func addTwoNumbers(_ node1: LinkedList?, _ node2: LinkedList?) -> LinkedList? {
        var n1: LinkedList? = node1
        var n2: LinkedList? = node2
        var carry = 0
        
        let dummy = LinkedList(value: 0)
        var current: LinkedList? = dummy
        
        while n1 != nil || n2 != nil || carry != 0 {
            var value1 = 0 , value2 = 0
            if n1 != nil { value1 = n1!.value }
            
            if n2 != nil { value2 = n2!.value }
            
            let sum = value1 + value2 + carry
            let newNodeValue = sum % 10
            
            let newNode = LinkedList(value: newNodeValue)
            current?.link = newNode
            current = newNode
            
            carry = sum / 10
            
            if n1 != nil  { n1 = n1?.link }
            if n2 != nil  { n2 = n2?.link }
        }
        
        return dummy.link
    }
}

/*
 the linked lists represent the numbers 75 and 42 in reverse order. Adding these two numbers gives us:

 75 + 42 = 117
 Input:
 
 n1 :  5 --> 7
 n2 :  2 --> 4
 
 Output :  7 --> 1 --> 1
 
 */
