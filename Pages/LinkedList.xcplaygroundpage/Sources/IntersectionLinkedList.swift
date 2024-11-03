//
//  IntersectionOfLinkedList.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/*
  Time Complexity: O(m + n) , where m and n are the lenghts of headA and headB respectively
  Space Complexity: O(1)
 */

public class IntersectionLinkedList {
    public init() { }
    
    public func intersection(_ headA: LinkedList?, _ headB: LinkedList?) -> LinkedList? {
        guard let headA, let headB else { return nil }
        var pA: LinkedList? = headA
        var pB: LinkedList? = headB
        
        while pA !== pB {
            // Move pointer A to next or switch to head of B if at the end of A
            pA = pA == nil ? headB : pA?.link
            
            // Move pointer B to next or switch to head of A if at the end of B
            pB = pB == nil ? headA : pB?.link
        }
        
        // If pA and pB meet, it's the intersection; otherwise, it's nil
        return pA
    }
}
