//: [Previous](@previous)

import Foundation


//let graph = Graph<String>()
//graph.addNode(value: "A")
//graph.addNode(value: "B")
//graph.addNode(value: "C")
//
//graph.addEdge(from: "A", to: "B", bidirectional: false)
//graph.addEdge(from: "B", to: "C")
//graph.addEdge(from: "A", to: "C")
//
//graph.printGraph()

print("--- Valid Path ---")
let edges = [[0,1],[1,2],[2,0]], source = 0, destination = 2
let result = ValidPath().validPath(3, edges, source, destination)
print(result)

print("--- Find Center Path ---")
let findCenterEdges = [[1,2],[2,3],[4,2]]
let centerEdgesResult = FindCenter().findCenter(findCenterEdges)
print(centerEdgesResult)

print("--- Detect Cycle in Directed Graph ---")
let cyclesEdges = [[1,2],[2,3],[3,1]]
let detectCycleInDirectedGraphResult = DetectCycleInDirectedGraph().detectCycle(cyclesEdges)
print(detectCycleInDirectedGraphResult)

print("--- Number of Islands ---")
let islandArray = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
  ]
let islandCount = NumberOfIslands().numIslands(islandArray)
print(islandCount)

print(" --- Island Perimeter ----")
let islandPerimeterArray = [
    [0,1,0,0],
    [1,1,1,0],
    [0,1,0,0],
    [1,1,0,0]
  ]
let perimeterCount = IslandPerimeter().islandPreimeter(islandPerimeterArray)
print(perimeterCount)

print(" --- Max Area Isalnd ----")
let maxAreaIslandArray = [
    [0,0,1,0,0],
    [1,1,1,0,0],
    [0,1,0,0,1],
    [0,0,0,1,1]
  ]
let islandMaxarea = MaxAreaIsland().maxAreaIsland(maxAreaIslandArray)
print(islandMaxarea)

print(" --- Room Keys ---")
let rooms = [[1],[2],[3],[]]
let roomKeysResult = RoomKeys().canVisitAllRooms(rooms)
print(roomKeysResult)

print("\n--- Shortest Distance ---")
let shortPathEdges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]]
let shortesDistance = ShortesPath().shortestPath(edges: shortPathEdges, from: 2, to: 7)
print(shortesDistance)

print("\n --- Longest Path ---")
let graphEdges = [(1, 2), (1, 3), (2, 4), (3, 4), (4, 5), (5, 6)]

// Create the graph
let graph = LongestPathGraph(edges: graphEdges)

// Find the longest paths starting from each node
let longestPaths = graph.findLongestPaths()

// Print the result
for (node, length) in longestPaths {
    print("Node \(node): Longest path length = \(length)")
}

print(" --- Ornage Rotting ---")
let grid = [
    [2, 1, 1],
    [1, 1, 0],
    [0, 1, 1]
]
let orangeRottinMinutes = OrangeRotting().orangesRotting(grid: grid)
print(orangeRottinMinutes)

print(" --- Number of Provinces --")
let isConnected = [
    [1, 1, 0],
    [1, 1, 0],
    [0, 0, 1]
]
let numberOfProvinces = NumberOfProvince().numberOfProvinces(isConnected)
print(numberOfProvinces)


