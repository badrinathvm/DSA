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

print("\n--- Has Cycle ---")
class LinkedListCycle {
    // Time Complexity O(N)
    static func hascycle(_ head: LinkedList?) -> Bool {
        // Edge case: if the list is empty or has only one node without a cycle
        guard let head = head , let _ = head.link else { return false }
        
        var slow: LinkedList? = head
        var fast: LinkedList? = head.link
    
        while fast != nil && fast?.link != nil {
            slow = slow?.link
            fast = fast?.link?.link
            
            if slow === fast {
                return true
            }
        }
        
        return false
    }
 }

let findLoopList = LinkedList.init(value: 3).addMany(values: [2,0,4])
findLoopList.getNthNode(n: 3).link = findLoopList.getNthNode(n: 1)
print(LinkedListCycle.hascycle(findLoopList))

print("\n--- Remove Duplicates from Linked List ---")
class RemoveDuplicatesFromLinkedList {
    static func removeDuplicatesFromLinkedList(_ head: LinkedList?) -> LinkedList? {
        guard let head = head else { return nil}
        let set  = NSMutableSet()
        
        var cur: LinkedList? = head
        var prev: LinkedList?
        
        while cur != nil {
            let value:Int = cur!.value
            if set.contains(value) {
                prev?.link = cur?.link
            } else {
                set.add(value)
                prev = cur
            }
            cur = cur?.link
        }
        
        return head
    }
}

let duplicateList = LinkedList.init(value: 1).addMany(values: [1,2,2,3])
let removeDupliocateList = RemoveDuplicatesFromLinkedList.removeDuplicatesFromLinkedList(duplicateList)
removeDupliocateList?.disp()

print("\n--- Intersection of Linked List ---")
class IntersectionOfLinkedList {
    static func intersectionOfLinkeDList(_ headA: LinkedList?, headB: LinkedList?) -> LinkedList? {
        guard headA != nil, headB != nil else { return nil }
        var pA = headA
        var pB = headB
        
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

let intersecNode = LinkedList(value: 8).addMany(values: [4,5])
let headA = LinkedList(value: 4).addMany(values: [1])
headA.link?.link = intersecNode

let headB = LinkedList(value: 5).addMany(values: [0,1])
headA.link?.link?.link = intersecNode

if let result = IntersectionOfLinkedList.intersectionOfLinkeDList(headA, headB: headB) {
    print("Intersected at node with value: \(result.value)") // Output: Intersected at node with value: 8
} else {
    print("No intersection")
}

print("\n--- Odd Even Indices Linked List ---")
class OddEvenList {
    
    // More space complexity because new array and linked is created.
    static func oddEvenList(_ head: LinkedList?) -> LinkedList? {
        guard head != nil else { return nil }
        var evenIndicesList = [Int](), oddIndicesList = [Int]()
        var cur: LinkedList? = head
        
        var index = 1
        while cur != nil {
            let value = cur!.value
            if index % 2 == 0 {
                evenIndicesList.append(value)
            } else {
                oddIndicesList.append(value)
            }
            cur = cur?.link
            index += 1
        }
        
        print(evenIndicesList)
        print(oddIndicesList)
        
        // need to decide which one to start odd or even, check the first element
        let decider = (head?.value)! % 2 == 0
        
        // create a linked List
        var temp = LinkedList(value: oddIndicesList.first!)
        var tempHead = temp
        for element in oddIndicesList.dropFirst() {
            temp.link = LinkedList(value: element)
            temp = temp.link!
        }
        
        for element in evenIndicesList {
            temp.link = LinkedList(value: element)
            temp = temp.link!
        }
        return tempHead
    }
    
    static func oddEvenIndicesList(_ head: LinkedList?) -> LinkedList? {
        guard head != nil , head?.link != nil else { return head }
        
        var odd = head  // Pointer to the first odd node
        var even = head?.link // Pointer to the first even node
        var evenHead = even // To remember the start of even nodes
        
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

let oddEvenInputList = LinkedList(value: 1).addMany(values: [2,3,4,5])
//let oddEvenInputList = LinkedList(value: 2).addMany(values: [1,3,5,6,4,7])
let oddEvenList = OddEvenList.oddEvenList(oddEvenInputList)
oddEvenList?.disp()

print("\n--- Delete Node in Linked List ---")
class DeleteNode {
    static func deleteNode(_ head: LinkedList?, _ k: Int) -> LinkedList? {
        // Create a dummy node to handle edge cases such as deleting the head
        let dummy = LinkedList(value: 0)
        dummy.link = head
        var prev: LinkedList? = dummy
        var cur:LinkedList? = head
        
        while cur != nil {
            let value = cur!.value
            if value == k {
                // Skip the node with value k
                prev?.link = cur?.link
            } else {
                // Move prev to the current node only if no deletion occurred
                prev = cur
            }
            cur = cur?.link
        }
        
        // Return the head of the modified list
        return dummy.link
    }
    
    func deleteNode(_ node: LinkedList?) {
        // Make sure node and node's next are not nil
        guard let node = node, let next = node.link else { return }
        
        // Copy the next node's value to the current node
        node.value = next.value
        
        // Skip the next node
        node.link = next.link
    }
}

let deleteInputList = LinkedList(value: 4).addMany(values: [5,1,9])
let deleteNodeList = DeleteNode.deleteNode(deleteInputList, 5)
deleteNodeList?.disp()
