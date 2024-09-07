//: [Previous](@previous)

import Foundation

print("--- Reverse Linked List ---")
class ReverseLinkedList {
    static func reversLinkList(_ list: LinkedList) -> LinkedList {
        var current:LinkedList? = list
        var prev:LinkedList?
        var temp:LinkedList? = current?.link
        
        while temp != nil {
            current?.link = prev
            prev = current
            current = temp
            temp = current?.link
        }
        
        current?.link = prev
        return current!
    }
}

let list = LinkedList(value: 10).addMany(values: [20,30,40])
let revserList = ReverseLinkedList.reversLinkList(list)
revserList.disp()

print("\n--- Palindrome Using Linked List ---")
class PalindromeLinkedList {
    static func palindrome(_ head: LinkedList) -> Bool {
        var isPalindrome = true
        var stack = Stack<Int>()
        
        var current: LinkedList? = head
        
        // Iterate over the list until it reaches nil and push each elemnt to stack
        while current != nil {
            stack.push((current?.value)!)
            current = current?.link
        }
        
        var temp: LinkedList? = head
        while temp != nil {
            if temp?.value != stack.pop() {
                isPalindrome = false
            }
            
            temp = temp?.link
        }
        
        
        return isPalindrome
    }
}

let palindromList = LinkedList(value: 10).addMany(values: [20, 10,30])
let palindrome = PalindromeLinkedList.palindrome(palindromList)
print(palindrome)
