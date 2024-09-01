//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Leetcode : https://leetcode.com/problems/reorganize-string/description/
class ReOrganize{
    
    // Logic:
    /*
     Better approach: Take the most frequent character each time
     And put it on hold for the characater which you just used previously
     */
    static func reorganizeString(_ s: String) -> String {
        // Count frequency of each character
        var count = [Character: Int]()
        for char in s {
            count[char, default: 0] += 1
        }

        // Create a MaxHeap and insert each character with its count
        var maxHeap = MaxHeap()
        for (char, cnt) in count {
            maxHeap.insert(cnt, char)
        }

        var prev: (Int, Character)? = nil
        var result = ""

        // Reorganize the string using the heap
        while !maxHeap.isEmpty {
            let (cnt, char) = maxHeap.removeMax()!

            // Append the current character to the result
            result.append(char)

            // If there was a previous character, push it back to the heap
            if let prevChar = prev {
                maxHeap.insert(prevChar.0, prevChar.1)
                prev = nil
            }

            // Set the current character as the new previous if its count is not zero
            if cnt > 1 {
                prev = (cnt - 1, char)
            }
        }

        // If there's a leftover character, it means reorganization is impossible
        return result.count == s.count ? result : ""
    }

}



// MaxHeap structure to manage the most frequent characters
struct MaxHeap {
    private var heap: [(Int, Character)] = []
    
    // Check if the heap is empty
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    // Return the size of the heap
    var size: Int {
        return heap.count
    }
    
    // Get the maximum element (root of the heap)
    var max: (Int, Character)? {
        return heap.first
    }
    
    // Helper function to get the index of the parent node
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // Helper function to get the index of the left child node
    private func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    // Helper function to get the index of the right child node
    private func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    // Insert a new element into the heap
    mutating func insert(_ key: Int, _ value: Character) {
        heap.append((key, value))
        siftUp(from: heap.count - 1)
    }
    
    // Remove and return the maximum element from the heap
    mutating func removeMax() -> (Int, Character)? {
        guard !heap.isEmpty else { return nil }
        
        if heap.count == 1 {
            return heap.removeFirst()
        } else {
            let maxValue = heap[0]
            heap[0] = heap.removeLast()
            siftDown(from: 0)
            return maxValue
        }
    }
    
    // Sift up the element at the given index to restore heap property
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let childValue = heap[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)
        
        while childIndex > 0 && childValue.0 > heap[parentIndex].0 {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
        
        heap[childIndex] = childValue
    }
    
    // Sift down the element at the given index to restore heap property
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        
        while true {
            let leftChild = leftChildIndex(of: parentIndex)
            let rightChild = rightChildIndex(of: parentIndex)
            var largest = parentIndex
            
            if leftChild < heap.count && heap[leftChild].0 > heap[largest].0 {
                largest = leftChild
            }
            
            if rightChild < heap.count && heap[rightChild].0 > heap[largest].0 {
                largest = rightChild
            }
            
            if largest == parentIndex {
                return
            }
            
            heap.swapAt(parentIndex, largest)
            parentIndex = largest
        }
    }
}



// Example usage:
let result = ReOrganize.reorganizeString("aabc")
print(result)  // Output might be "aba" depending on heap's order


