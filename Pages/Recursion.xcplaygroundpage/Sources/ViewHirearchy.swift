//
//  ViewHirearchy.swift
//  
//
//  Created by Rani Badri on 11/11/24.
//
import UIKit

public extension UIView {
    func printHirerachy(level: Int = 0 , prefix: String = "") {
        // Determine the number of pipes based on the level
        let pipeCount = String(repeating: "|", count: level)
        let printPrefix = "\(pipeCount)\(prefix)\(self)"
        
        // Print current view with pipes and prefix
        print(printPrefix)
        
        // recursively print subviews
        for (index, subView) in self.subviews.enumerated() {
            // Maintain spacing
            let newPrefix = prefix + " "
            // recurively call
            subView.printHirerachy(level: index + 1, prefix: newPrefix)
        }
    }
}
