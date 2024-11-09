//
//  ShortesPathInGrid.swift
//
//
//  Created by Rani Badri on 11/9/24.
//

public struct Position: Hashable {
    let x: Int
    let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

public class ShortesPathInGrid {
    public init() {
        
    }
    
    public func shortestPathInGrid(grid: [[Int]], start: Position, end: Position) -> Int? {
        let directions = [
            Position(x: 0, y: 1), // Right
            Position(x: 1, y: 0), // Down
            Position(x: 0, y: -1), // Left
            Position(x: -1, y: 0), // Up
        ]
        
        var queue: Queue<(Position, Int)> = Queue<(Position, Int)>()
        queue.push((start,0))
        var visited:Set<Position> = [start]
        
        while !queue.empty() {
            let levelCount = queue.arr.count
            for _ in 0..<levelCount {
                let (current, distance) = queue.front
                
                _ = queue.pop()
                
                // check if we have reached end
                if current == end {
                    return distance
                }
                
                // explore neighbors
                for direction in directions {
                    let newX = current.x + direction.x
                    let newY = current.y + direction.y
                    let neighbor = Position(x: newX, y: newY)
                    
                    // check if neighbor is within the bounds and walakable
                    if newX >= 0 && newY >= 0 &&  newX < grid.count && newY < grid[0].count
                        && grid[newX][newY] == 0 && !visited.contains(neighbor) {
                        
                        queue.push((neighbor, distance + 1))
                        visited.insert(neighbor)
                    }
                }
            }
        }
        return nil
    }
}

/*
  Input :
 [0, 1, 0, 1, 1, 0, 1],
 [0, 1, 1, 1, 1, 0, 1],
 [0, 0, 0, 1, 1, 0, 1],
 [1, 1, 0, 1, 1, 0, 1],
 [1, 0, 1, 1, 1, 0, 1],
 [0, 1, 0, 0, 0, 0, 0]
 
 start = Position(x: 0, y: 0)
 end = Position(x: 3, y: 2)
 
 Output:
 
 The shortest path length is 5
 
 */
