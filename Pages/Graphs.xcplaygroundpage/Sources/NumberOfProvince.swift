//
//  NumberOfProvince.swift
//  
//
//  Created by Rani Badri on 12/12/24.
//

/*
  Time Complexity : O (n ^ 2), where n is the number of cities
  Space Complexity : O(n) for the recursion set( visited)
  
 Approach: DFS
 1.Track Visited Cities: Use a visited set to keep track of cities that have already been explored during the traversal.

 2.Explore Provinces: For each city, if it hasn’t been visited, it means we’ve found a new province. Perform a DFS from that city to mark all connected cities as visited.

 3. Count Provinces: Increment the province count each time we start a new DFS from an unvisited city.
 */


public class NumberOfProvince {
    public init() { }
    
    public func numberOfProvinces(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        var visited = Set<Int>()
        
        var provinceCount = 0
        
        func dfs(_ city: Int) {
            visited.insert(city)
            for neighbor in 0..<n {
                if isConnected[city][neighbor] == 1 && !visited.contains(neighbor) {
                    dfs(neighbor)
                }
            }
        }
        
        for city in 0..<n {
            if !visited.contains(city) {
                provinceCount += 1
                dfs(city)
            }
        }
        
        return provinceCount
    }
}


/*
  Input :
 [
     [1, 1, 0],
     [1, 1, 0],
     [0, 0, 1]
 ]
 
 Final Result:
    Provinces Identified:
            Province 1: Cities {0, 1}.
            Province 2: City {2}.
    Output: 2.

 */
