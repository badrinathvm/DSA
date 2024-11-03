//
//  Palindrome.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/*
  Time Complexity: O(n) , where n is the number of nodes
  Space Complexity: O(1)
 */

public class PalindromeLinkedList {
    public init() {}
    
    public func palindrome(_ head: LinkedList?) -> Bool {
        var isPalindrome = true
        var stack = Stack<Int>()
        
        var current = head
        
        // Iterate over the list until it reaches nil and push each elemnt to stack
        while let node = current {  // this equates to while current != nil
            stack.push(node.value)
            current = current?.link
        }
        
        var temp = head
        while let node = temp {
            if node.value != stack.pop() {
                isPalindrome = false
            }
            temp = temp?.link
        }
        
        return isPalindrome
    }
}

/*
  Input:  1--> 2 --> 1
 
  Output: true
 */
