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
let oddEvenInputList = LinkedList(value: 1).addMany(values: [2,3,4,5])
let oddEvenList = OddEvenLinkedList().oddleEvenList(oddEvenInputList)
oddEvenList?.disp()

print("\n--- Delete Node in Linked List ---")
let deleteInputList = LinkedList(value: 4).addMany(values: [5,1,9])
let deleteNodeList = DeleteNodeLinkedList().deleteNode(deleteInputList, 5)
deleteNodeList?.disp()

print("\n--- Remove Node from End ---")
let removeNodeList = LinkedList(value: 1).addMany(values: [2,3,4,5])
let removeNodeOutputList = RemoveNodeFromEnd().removeNodeFromEnd(removeNodeList, 2)
removeNodeOutputList?.disp()

print("\n\n--- Swap Nodes ---")
let swapNodeInputList = LinkedList(value: 1).addMany(values: [2,3,4])
let swapNodeOutputList = SwapNodes().swapNodes(swapNodeInputList)
swapNodeInputList.disp()


print("\n\n --- Add two numbers ---")
let n1 = LinkedList(value: 5).addMany(values: [7])
let n2 = LinkedList(value: 2).addMany(values: [4])
let addOutputList = AddTwoNumbers().addTwoNumbers(n1, n2)
addOutputList?.disp()

print("\n --- Remove Node From Linked List ---")
let removeNodesList = LinkedList(value: 5).addMany(values: [2, 13, 3, 8])
let removeNodesOutputList = RemoveNodeFromLinkedList().removeNodes(removeNodesList)
removeNodesOutputList?.disp()
