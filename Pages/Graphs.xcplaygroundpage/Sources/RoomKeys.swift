//
//  Untitled.swift
//  
//
//  Created by Rani Badri on 10/28/24.
//

/**
  Time Complexity : O(N + E) where N : Visit each room at most once, E - Traverse each key in each room exactly once in worst case.
  Space Compelxity : O(N)
 */
public class RoomKeys {
    public init() {}
    
    public func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited: Set<Int> = []
        
        func dfs(_ room: Int) {
            // Mark the room as visited
            visited.insert(room)
            
            for key in rooms[room] {
                if !visited.contains(key) {
                    // visit the next room recursively
                    dfs(key)
                }
            }
        }
        
        dfs(0) // start with room 0
        
        // check if we have visited all the rooms
        return visited.count == rooms.count
    }
}

/**
 Input: rooms = [[1,3],[3,0,1],[2],[0]]
 Output: false
 
 Walkthrough
 With rooms = [[1,3],[3,0,1],[2],[0]]:

 Start in Room 0:

 visited = {0}.
 Keys available: [1, 3].
 Use Key to Visit Room 1:

 visited = {0, 1}.
 Room 1’s keys: [3, 0, 1].
 Key 3 leads us to room 3 (we’ll use it since room 3 is unvisited).
 Use Key to Visit Room 3:

 visited = {0, 1, 3}.
 Room 3’s key: [0].
 Room 0 is already visited, so we do not visit it again.
 Remaining Room (Room 2):

 At this point, we’ve used all available keys but haven’t visited room 2, which is inaccessible from the starting room 0.
 Final Check:

 Since visited.count == 3 and rooms.count == 4, the function returns false.
 

 */
