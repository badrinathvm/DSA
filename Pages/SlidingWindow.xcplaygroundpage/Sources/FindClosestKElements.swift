//
//  FindClosestKElements.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

/*
 Approach
 step 1: Binary Search to Find the Closest Starting Point:

 First, we perform a binary search to find the starting position of a k-length window containing the k closest elements.
 We use two pointers, left and right, initialized to 0 and len(arr) - k respectively, to find the optimal starting point of our window.
 
 Step 2: Window Adjustment Using Binary Search:
 At each midpoint, compare the closeness of the elements at mid and mid + k to x.
 If arr[mid] is farther from x than arr[mid + k], then move the window to the right (i.e., left = mid + 1). Otherwise, shift right to mid.
 
 Step 3: Extract and Return the Closest Elements:
 Once the binary search converges, the window of k closest elements is found at arr[left..<left + k].
 */

/**
  Time Complexity: O(log(n-k) + k)
  Space Complexity : O(K)
 */

public class FindClosestKElements {
    public init() { }
    
    public func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - k
        var mid = 0
        
        // Binary search to find the smallest left bound for the window
        while left < right {
            let mid = (left + right) / 2
            
            // Compare distances: if arr[mid] is further than arr[mid + k], move the window to the right
            if x - arr[mid] > arr[mid +  k] - x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        //slice out the closet k elements starting from `left`
        return Array(arr[left..<(left+k)])
    }
}

/*
 
 Input: arr = [1,2,3,4,5], k = 4, x = 3

 Output: [1,2,3,4]
 
 
 */
