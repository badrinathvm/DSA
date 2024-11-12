//
//  GroupAnagrams.swift
//  
//
//  Created by Rani Badri on 11/12/24.
//

//Time Complexity - O(N∗K∗Log(K))
public class GroupAnagrams {
    public init() { }

    public func groupAnagrams(_ strs: [String]) -> [[String]] {
        guard strs.count > 0 else { return [[""]] }
        
        let result = strs.reduce(into: [String: [String]]()) { dict, element in
            dict[String(element.sorted()), default: []] += [element]
        }
        
        let groupedAnagrams = result.values.map { $0 }
        return groupedAnagrams
    }
}

/*
 Input: ["eat","tea","tan","ate","nat","bat"]
 Ouptut: 
 
 [["tan", "nat"], ["bat"], ["eat", "tea", "ate"]]
 
 */

