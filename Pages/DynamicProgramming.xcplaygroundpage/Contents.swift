//: [Previous](@previous)

import Foundation

print("--Ball Jumping Stairs / Climbing stairs")
let ballJumpingWays = BallJumpingStairs()
let n = 5
let ways = ballJumpingWays.ballJumpingStairs(n: n)
print("Number of ways to reach step \(n):", ways)

print("\n--- Word Breask Problem ---")
let wordBreakProblem = WordBreak()
let input = "leetcode"
let wordDict: [String] = ["leet", "code"]
let result = wordBreakProblem.wordBreak(s: input, wordDict: wordDict)
print("Word Break:", result)

print("\n -- Min Path Sum ---")
let grid: [[Int]] = [
    [1, 3, 1],
    [1, 5, 1],
    [4, 2, 1]
  ]
let minPathSumResult = MinPathSum().minPathSum(grid: grid)
print(minPathSumResult)
