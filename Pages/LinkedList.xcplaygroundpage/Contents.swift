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
