//
//  SwapNodes.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

public class SwapNodes {
    public init() { }
    
    public func swapNodes(_ head: LinkedList?) -> LinkedList? {
        guard let head else { return nil }
        
        var counter: Int = 0
        var temp: LinkedList? = head
        var prev: LinkedList? = head
        var cur: LinkedList? = head.link
        
        while temp?.link != nil {
            if counter % 2 == 0 {
                var preValue = prev!.value
                prev!.value = cur!.value
                cur!.value = preValue
                
                prev = prev?.link?.link
                cur = cur?.link?.link
            }
            temp = temp?.link
            counter += 1
        }
        
        return head
    }
}


/*
 Input:
  1 --> 2 --> 3 --> 4
 
 Output:
 2 --> 1 --> 4 --> 3
 
 
 
 */
