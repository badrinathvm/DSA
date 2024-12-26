//: [Previous](@previous)

import Foundation

print(" -- Search Suggestion System --")
let searchSystem = SearchSuggestionsSystem()
let products = ["mobile", "mouse", "moneypot", "monitor", "mousepad"]
let searchWord = "mouse"
print(searchSystem.suggestedProducts(products, searchWord))

print("-- Longest Common Prefix --")
let longestCommonPrefix = LongestCommonPrefix()
let strs = ["flower", "flow", "flight"]
print(longestCommonPrefix.longestCommonPrefix(strs))

print(" -- Word Dictionary --")
let wordDictionary = AddSearchWord()
// Add words
wordDictionary.addWord("bad")
wordDictionary.addWord("dad")
wordDictionary.addWord("mad")

// Search words
print(wordDictionary.search("pad")) // Output: false (word not found)
print(wordDictionary.search("bad")) // Output: true  (exact match)
print(wordDictionary.search(".ad")) // Output: true  (wildcard matches "bad", "dad", "mad")
print(wordDictionary.search("b..")) // Output: true  (wildcard matches "bad")
