//
//  FindCommonCharacters.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

public class FindCommonCharacters {
    public init() {
        
    }
    
    public func findCommon(_ words: [String] ) -> [String] {
        var result = [String]()
        
        // this method calculates the freuqnecy of eahc of the  letter int he word
        func charFrequency(word: String) -> [Character: Int] {
            let result = word.reduce(into: [:]) { dict, element in
                dict[element, default: 0] += 1
            }
            return result
        }
        
        var commonFrequency = charFrequency(word: words[0])
        
        //This loop identifies the common letters across each of the words
        for word in words.dropFirst() {
            let wordFeq = charFrequency(word: word)
            
            // identify the common character between the two words, so we use min( intersection of character across multipl ewords)
            for (key, value) in commonFrequency {
                commonFrequency[key] = min(value, wordFeq[key] ?? 0)
            }
        }
        
        for (key, value) in commonFrequency {
            if value > 0 {
                result.append(contentsOf: Array(repeating: String(key), count: value))
            }
        }
        
        return result
    }
}

