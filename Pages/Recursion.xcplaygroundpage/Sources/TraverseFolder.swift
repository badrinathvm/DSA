//
//  TrverseFolder.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//
import Foundation

public class TraverseFolder {
    public init() { }
    
    func changePermissions(for path: String, permissions: Int) -> Bool {
        let fileManager = FileManager.default
        let attributes = [FileAttributeKey.posixPermissions: permissions]

        do {
            try fileManager.setAttributes(attributes, ofItemAtPath: path)
            print("Permissions successfully changed to \(String(format: "%o", permissions)) for \(path)")
            return true
        } catch {
            print("Failed to change permissions for \(path): \(error.localizedDescription)")
            return false
        }
    }
    
    public func traveseDirectory(at url : URL) -> Int {
        let fileManager = FileManager.default
        var fileCount = 0
        
        do {
            // Get the contents of the directory
            let contents = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for item in contents {
                if item.hasDirectoryPath {
                    print("Directory: \(item.path)")
                    
                    // Change permissions for the directory
                    _ = changePermissions(for: item.path, permissions: 0o755)
                    
                    // Recursive call for the subdirectory
                    let subDirectoryFileCount = traveseDirectory(at: item)
                    fileCount += subDirectoryFileCount
                } else {
                    print("File: \(item.path)")
                    fileCount += 1
                }
            }
        } catch {
            print("Error reading the contents of dorectory: \(error)")
        }
        return fileCount
    }
}
