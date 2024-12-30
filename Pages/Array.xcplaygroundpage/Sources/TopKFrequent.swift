//
//  TopKFrequent.swift
//  
//
//  Created by Rani Badri on 12/30/24.
//

/*
 
  Time Complexity:
 •    Building the frequency map: O(n), where n is the size of nums.
 •    Maintaining the heap: O(n * log k), as each insert or remove operation on the heap is O(log k), and we process n elements.
Overall: O(n * log k)
 
 Space Complexity:
     •    Frequency map: O(n).
     •    Heap: O(k).
 Overall: O(n + k).
 
 */

public class TopKFrequent {
    public init() {
        
    }
    
    public func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // Step 1: Count frequencies using a dictionary
        let frequencyMap = nums.reduce(into: [:] ) { dict, element in
            dict[element, default: 0] += 1
        }
        
        // Step 2: Use a min-heap (priority queue) to store the top k elements
        var heap = [(Int, Int)]() // (frequency, num))
        
        for (element, frequency) in frequencyMap {
            heap.append((frequency, element))
            
            // Ensure that size doesnt exceek K
            if heap.count > k {
                heap.sort { $0.0 > $1.0 } // sort the frequency in descending order
                heap.removeLast() // Remove the least frequent element
            }
        }
        
        // Step 3: Extract the elements from the heap
        return heap.map { $0.1 }
    }
}

/*
 Example 1:

 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 
 */

