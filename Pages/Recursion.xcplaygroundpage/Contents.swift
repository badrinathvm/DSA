//: [Previous](@previous)

import Foundation
import UIKit

extension UIView {
    func printViewHierarchy(level : Int = 0 , prefix: String = "") {
        // Determine the number of pipes based on the level
        let pipeCount = String(repeating: "|", count: level)
        let printPrefix = "\(pipeCount)\(prefix)\(self)"
        
        // Print current view with pipes and prefix
        print(printPrefix)
        
        // recusruvely print subviews
        for (index, subview) in self.subviews.enumerated() {
            // Maintain alignment
            let newPrefix = prefix + " "
            subview.printViewHierarchy(level: index + 1, prefix: printPrefix)
        }
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Creating a notable view
        let notableView = UIView()
        notableView.backgroundColor = .red
        notableView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)

        // Creating two more views inside notableView
        let subView1 = UIView()
        subView1.backgroundColor = .blue
        subView1.frame = CGRect(x: 10, y: 10, width: 50, height: 50)

        let subView2 = UIView()
        subView2.backgroundColor = .green
        subView2.frame = CGRect(x: 20, y: 20, width: 60, height: 60)

        let subView3 = UIView()
        subView3.backgroundColor = .yellow
        subView3.frame = CGRect(x: 30, y: 30, width: 70, height: 70)

        notableView.addSubview(subView1)
        notableView.addSubview(subView2)
        notableView.addSubview(subView3)
        self.view.addSubview(notableView)

        // Print the hierarchy starting from the root view
        self.view.printViewHierarchy()
      }
}

// let viewController = ViewController()
// viewController.viewDidLoad()


let canConstruction = CanConstruct()
let result = canConstruction.canConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"])
print(result)

let traverseFolder = TraverseFolder()
if let url = URL(string: "file:////Users/ranibadri/Documents/projects") {
    _ = traverseFolder.traveseDirectory(at: url)
}

