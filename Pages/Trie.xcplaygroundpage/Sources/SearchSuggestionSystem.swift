//
//  SearchSuggestionSystem.swift
//  
//
//  Created by Rani Badri on 12/24/24.
//

public class SearchSuggestionsSystem {
    
    public init() {
    }
    
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var words: [String] = []
    }
    
    private let root = TrieNode()
    
    // Insert a word into the Trie
    private func insert(_ word: String) {
        var current = root // Start from the root node
        
        // Iterate through each character in the word
        for char in word {
            // If the current character does not have a corresponding child node, create one
            if current.children[char] == nil {
                current.children[char] = TrieNode() // Initialize a new TrieNode for the character
            }
            
            // Move to the child node corresponding to the current character
            current = current.children[char]!
            
            // Add the word to the `words` array of the current node
            // Only add if the array has fewer than 3 words to ensure we store at most 3 suggestions
            if current.words.count < 3 {
                current.words.append(word)
            }
        }
    }
    
    // Function to search for the top 3 suggestions for a given prefix
    func search(_ prefix: String) -> [String] {
        var current = root // Start from the root node
        
        // Traverse the Trie using the characters in the prefix
        for char in prefix {
            // If the current character doesn't have a corresponding child node, return an empty list
            if current.children[char] == nil {
                return [] // No suggestions found for this prefix
            }
            
            // Move to the child node corresponding to the current character
            current = current.children[char]!
        }
        
        // Return the `words` array stored at the last node of the prefix
        return current.words
    }
    
    public func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        // Step 1: Sort the products lexicographically
        let sortedProducts = products.sorted()
        
        // Step 2: Build the Trie using the sorted products
        for product in sortedProducts {
            self.insert(product)
        }
        
        // Step 3: For each prefix of the searchWord, fetch suggestions from the Trie
        var results: [[String]] = []
        var prefix = ""
        
        for char in searchWord {
            prefix.append(char) // Add the current character to the prefix
            let suggestions = self.search(prefix) // Get the top 3 suggestions for the prefix
            results.append(suggestions) // Append suggestions to the results
        }
        
        return results
    }
}


/**
 
 
Root
 |
 'm' → ['mobile', 'moneypot', 'monitor']
  |
 'o' → ['mobile', 'moneypot', 'monitor']
  |
 'b' → ['mobile']
  |
 'i' → ['mobile']
  |
 'l' → ['mobile']
  |
 'e' → ['mobile']

  (Back to 'm' → 'o')
  |
 'n' → ['moneypot', 'monitor']
  |
 'e' → ['moneypot']
  |
 'y' → ['moneypot']
  |
 'p' → ['moneypot']
  |
 'o' → ['moneypot']
  |
 't' → ['moneypot']

  (Back to 'm' → 'o' → 'n')
  |
 'i' → ['monitor']
  |
 't' → ['monitor']
  |
 'o' → ['monitor']
  |
 'r' → ['monitor']

  (Back to 'm' → 'o')
  |
 'u' → ['mouse', 'mousepad']
  |
 's' → ['mouse', 'mousepad']
  |
 'e' → ['mouse', 'mousepad']
      |
      'p' → ['mousepad']
      |
      'a' → ['mousepad']
      |
      'd' → ['mousepad']

**/

/**
 
 {
   "": {
     "m": {
       "words": ["mobile", "moneypot", "monitor"],
       "children": {
         "o": {
           "words": ["mobile", "moneypot", "monitor"],
           "children": {
             "b": {
               "words": ["mobile"],
               "children": {
                 "i": {
                   "words": ["mobile"],
                   "children": {
                     "l": {
                       "words": ["mobile"],
                       "children": {
                         "e": {
                           "words": ["mobile"],
                           "children": {}
                         }
                       }
                     }
                   }
                 }
               }
             },
             "n": {
               "words": ["moneypot", "monitor"],
               "children": {
                 "e": {
                   "words": ["moneypot"],
                   "children": {
                     "y": {
                       "words": ["moneypot"],
                       "children": {
                         "p": {
                           "words": ["moneypot"],
                           "children": {
                             "o": {
                               "words": ["moneypot"],
                               "children": {
                                 "t": {
                                   "words": ["moneypot"],
                                   "children": {}
                                 }
                               }
                             }
                           }
                         }
                       }
                     }
                   }
                 },
                 "i": {
                   "words": ["monitor"],
                   "children": {
                     "t": {
                       "words": ["monitor"],
                       "children": {
                         "o": {
                           "words": ["monitor"],
                           "children": {
                             "r": {
                               "words": ["monitor"],
                               "children": {}
                             }
                           }
                         }
                       }
                     }
                   }
                 }
               }
             },
             "u": {
               "words": ["mouse", "mousepad"],
               "children": {
                 "s": {
                   "words": ["mouse", "mousepad"],
                   "children": {
                     "e": {
                       "words": ["mouse", "mousepad"],
                       "children": {
                         "p": {
                           "words": ["mousepad"],
                           "children": {
                             "a": {
                               "words": ["mousepad"],
                               "children": {
                                 "d": {
                                   "words": ["mousepad"],
                                   "children": {}
                                 }
                               }
                             }
                           }
                         }
                       }
                     }
                   }
                 }
               }
             }
           }
         }
       }
     }
   }
 }
 */
