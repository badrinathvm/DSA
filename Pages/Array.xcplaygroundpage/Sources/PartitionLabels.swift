//
//  PartitionLabels.swift
//  
//
//  Created by Rani Badri on 12/25/24.
//

public class PartitionLabels {
    public init() { }
    
    public func partitionLabel(_ s: String) -> [Int] {
        var result = [Int]() // To store the sizes of partitions
        var chars = Array(s)
        var lastIndex = [Character: Int]() // To store the last occurrence of each character
        
        // Populate lastIndex with the last occurrence of each character
        for (index, element) in chars.enumerated() {
            lastIndex[element] = index
        }
        
        var start = 0
        var end = 0
        
        for (index, char) in chars.enumerated() {
            // Update end to the farthest occurrence of current character
            end = max(end, lastIndex[char]!)
            
            if index == end  {
                // Partition ends here
                result.append(end - start + 1)
                // Update start for the next partition
                start = index + 1
            }
        }
        
        return result
    }
}

/*
 
 Input :
 "ababcbacadefegdehijhklij"
 
 Output:
 Partition Sizes: [9, 7, 8]
 
 Explanation:
     1.    The first partition is "ababcbaca", where all characters 'a', 'b', and 'c' appear.
     2.    The second partition is "defegde", where all characters 'd', 'e', 'f', and 'g' appear.
     3.    The third partition is "hijhklij", where all characters 'h', 'i', 'j', 'k', and 'l' appear.
 */
