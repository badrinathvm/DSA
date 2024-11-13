//
//  WordBreak.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//

/*
 
  Time Complexity : O(n ^ 2), where n is the length of s
  Space Compelxity: O(n + m) , where n is the lenght of s and m is the lenght of number of words in the word Dict
 
 */

public class WordBreak {
    public init() {}
    
    public func wordBreak(s: String, wordDict: [String]) -> Bool {
        let wordSet = Set(wordDict)
        
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        
        for i in 1...s.count {
            for j in 0..<i {
                // fetch start and end Index
                let startIndex = s.index(s.startIndex, offsetBy: j)
                let endIndex = s.index(s.startIndex, offsetBy: i)
                // get teh substring
                let subString = String(s[startIndex..<endIndex])
                
                // check if the subs tring exists in the wordDict Set
                if dp[j] && wordSet.contains(subString) {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[s.count]
    }
}

/*
 Input: s = "leetcode", wordDict = ["leet", "code"]
 
 Output: true

 */

