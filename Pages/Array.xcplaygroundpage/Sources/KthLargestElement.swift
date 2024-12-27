//
//  KthLargestElement.swift
//  
//
//  Created by Rani Badri on 11/4/24.
//


public class KthLargestElement {
    public init() {
        
    }
    
    public func findKthLargetsElement(_ nums: [Int], _ k: Int) -> Int {
       // nums.sorted().reversed()[k-1]
        var minHeap =  [Int]()
        for num in nums {
            // add to the heap
            minHeap.append(num)
            minHeap.sort()
            
            if minHeap.count > k {
                minHeap.removeFirst()
            }
        }
        
        return minHeap.first ?? -1
        
        
//        var heap = Heap<Int>()
//               for num in nums{
//                   heap.insert(num)
//                   if heap.count > k{ heap.removeMin() }
//               }
//               return heap.min!
    }
}

/*
 Input:
  nums = [3,2,1,5,6,4],  k = 2
 
 Output:
  
 */
