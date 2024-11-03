//: [Previous](@previous)

import Foundation

print("--- Reverse Linked List ---")
let list = LinkedList(value: 10).addMany(values: [20,30,40])
let revserList = ReverseLinkedList().reverse(list)
revserList?.disp()

print("\n--- Palindrome Using Linked List ---")
let palindromList = LinkedList(value: 1).addMany(values: [2, 1])
let palindrome = PalindromeLinkedList().palindrome(palindromList)
print(palindrome)

print("\n--- Has Cycle ---")
let findLoopList = LinkedList.init(value: 3).addMany(values: [2,0,4])
findLoopList.getNthNode(n: 3).link = findLoopList.getNthNode(n: 1)
let hasCycle = HasCycle().hasCycle(findLoopList)
print(hasCycle)

print("\n--- Remove Duplicates from Linked List ---")
let duplicateList = LinkedList.init(value: 1).addMany(values: [1,2,2,3])
let removeDupliocateList = RemoveDuplicatesFromList().removeDuplicates(duplicateList)
removeDupliocateList?.disp()

print("\n--- Intersection of Linked List ---")
let intersecNode = LinkedList(value: 8).addMany(values: [4,5])
let headA = LinkedList(value: 4).addMany(values: [1])
headA.link?.link = intersecNode

let headB = LinkedList(value: 5).addMany(values: [0,1])
headB.link?.link?.link = intersecNode

if let result = IntersectionLinkedList().intersection(headA, headB) {
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

print("\n--- Remove Node from End ---")
class RemoveNodeFromEnd {
    // time Complexity : O(N)
    static func removeNodeFromEnd(_ head: LinkedList?, _ k: Int) -> LinkedList? {
        guard head != nil else { return nil }
        
        var dummy = LinkedList(value: 0)
        dummy.link = head
        
        var counter = 0
        var first: LinkedList? = dummy
        var second: LinkedList? = dummy
        
        while counter < k {
            second = second?.link
            counter += 1
        }
        
        while second?.link != nil {
            first = first?.link
            second = second?.link
        }
        
        first?.link = first?.link?.link
        
        return dummy.link
    }
}

let removeNodeList = LinkedList(value: 1).addMany(values: [2,3,4,5])
let removeNodeOutputList = RemoveNodeFromEnd.removeNodeFromEnd(removeNodeList, 2)
removeNodeOutputList?.disp()

print("\n--- Swap Nodes ---")
class SwapNodes {
    static func swapNodes(_ head: LinkedList?) -> LinkedList? {
        guard head != nil else { return nil }
        
        var counter = 1
        var temp:LinkedList? = head
        var prev: LinkedList? = head
        var cur:LinkedList? = head?.link
        
        while temp != nil {
            if counter % 2 == 0 {
                var tempValue = prev!.value
                prev?.value = cur!.value
                cur?.value = tempValue
                
                prev = prev?.link?.link
                cur = cur?.link?.link
            }
            temp = temp?.link
            counter += 1
        }
       
        return head
    }
}

let swapNodeInputList = LinkedList(value: 1).addMany(values: [2,3,4])
let swapNodeOutputList = SwapNodes.swapNodes(swapNodeInputList)
swapNodeInputList.disp()


print("\n--- Add two numbers ---")
class AddTwoNumbers{
    // Time Complexity - O(Max(M,N))
    static func addTwoNumbers(_ node1: LinkedList?, _ node2: LinkedList?) -> LinkedList? {
        var dummy = LinkedList(value: 0)
        
        var cur: LinkedList = dummy
        var carry = 0
        
        var n1: LinkedList? = node1
        var n2: LinkedList? = node2
        
        while n1 != nil || n2 != nil || carry != 0 {
            var value1 = 0 , value2 = 0
            
            if n1 != nil { value1 = n1!.value }
            
            if n2 != nil { value2 = n2!.value }
            
            var sum = value1 + value2 + carry
            let newValue = sum % 10
            
            var newNode = LinkedList(value: newValue)
            cur.link = newNode
            cur = newNode
            
            carry = sum / 10
            
            if n1 != nil  { n1 = n1?.link }
            if n2 != nil  { n2 = n2?.link }
        }
        
        return dummy.link!
    }
}

let n1 = LinkedList(value: 2).addMany(values: [4,3])
let n2 = LinkedList(value: 5).addMany(values: [6,4])
let addOutputList = AddTwoNumbers.addTwoNumbers(n1, n2)
addOutputList?.disp()

print("\n --- Remove Node From Linked List ---")
let removeNodesList = LinkedList(value: 5).addMany(values: [2, 13, 3, 8])
let removeNodesOutputList = RemoveNodeFromLinkedList().removeNodes(removeNodesList)
removeNodesOutputList?.disp()
