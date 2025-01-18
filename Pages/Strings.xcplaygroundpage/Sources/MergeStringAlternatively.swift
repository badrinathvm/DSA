//
//  Untitled.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/*
  Approach :
    Step 1: Zip for words which returns a atuple and forma astring.
    Step 2: for remainign portion of the string, get the min(w1.count, w2.count) and then drop that do the same thign for the second word as well.
    Step 3: Append the remainign part top the resulting string.
 
  Time Complexity : O(max(m,n)) m is the lenght of the first word, n is the lenght of second word.
  Space Compelxity: O(m + n) - building a new string which has the length of  first word andsecond word ( m + n )
 */

public class MergeStringAlternatively {
    public init() {}
    
    public func mereStrings(_ word1: String, _ word2 : String) -> String {
        var result = ""
        zip(word1, word2).forEach { element in
                result += "\(element.0)\(element.1)"
        }
        
        // Key Sauce
        let remainingPart = word1.dropFirst(min(word1.count, word2.count))
        + word2.dropFirst(min(word1.count, word2.count))
        
        result += remainingPart
        return result
    }
}

/*
 
 Input : "abcxy", "def"
 
 Output: "adbecfxy
 
 */
