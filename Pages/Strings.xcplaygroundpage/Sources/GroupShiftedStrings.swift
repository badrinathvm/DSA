//
//  GroupShiftedStrings.swift
//  
//
//  Created by Rani Badri on 12/27/24.
//

/*
  Approach :
 
   1. For each string, calculate the differences between consecutive characters modulo 26.
    for eg: ["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"]
 
     1.    "abc":
     •    Differences: b - a = 1, c - b = 1 → Pattern: "1,1,".
     2.    "bcd":
     •    Differences: c - b = 1, d - c = 1 → Pattern: "1,1,".
     3.    "acef":
     •    Differences: c - a = 2, e - c = 2, f - e = 1 → Pattern: "2,2,1,".
     4.    "xyz":
     •    Differences: y - x = 1, z - y = 1 → Pattern: "1,1,".
     5.    "az":
     •    Differences: z - a = 25 → Pattern: "25,".
     6.    "ba":
     •    Differences: a - b = -1, but modulo 26 → 25 → Pattern: "25,".
     7.    "a":
     •    Single character, no differences → Pattern: "".
     8.    "z":
     •    Single character, no differences → Pattern: "".

  2. Group Strings by pattern
     [
         ["acef"],                 // Group for pattern "2,2,1,"
         ["a", "z"],               // Group for pattern ""
         ["abc", "bcd", "xyz"],    // Group for pattern "1,1,"
         ["az", "ba"]              // Group for pattern "25,"
     ]
 */

/*
 1.    Time Complexity:
    •    Calculating the shift pattern for a string takes ( O(L) ), where  L  is the average length of the string.
    •    For  n  strings, total time is  O(n \times L) .
    2.    Space Complexity:
    •    Dictionary to store groups:  O(n \times L) , where  L  is the length of the string.
    •    Total:  O(n \times L) .
 
 */
public class GroupShiftedStrings {
    public init() {
    }
    
    public func groupStrings(_ strings: [String]) -> [[String]] {
        var groups: [String: [String]] = [:]
        
        // Function to calculate the shift pattern for a string
        func getShiftPattern(_ s: String) -> String {
            let chars = Array(s)
            var pattern = ""
            
            for i in 1..<chars.count {
                let diff = (Int(chars[i].asciiValue!) - Int(chars[i-1].asciiValue!) + 26) % 26
                pattern += "\(diff),"
            }
            
            return pattern
        }
        
        // Group strings based on their shift pattern
        for string in strings {
            let pattern = getShiftPattern(string)
            groups[pattern, default: []].append(string)
        }
        
        // Return grouped strings as list of lists
        return Array(groups.values)
    }
    
}


/*
 
 Input: strings = ["abc","bcd","acef","xyz","az","ba","a","z"]

 Output: [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]

 */
