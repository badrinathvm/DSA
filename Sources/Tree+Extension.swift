import Foundation

public class Tree {
    public var value: Int
    public var left: Tree?
    public var right: Tree?
    
    public init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    public func preOrderTraversal(root: Tree?) -> [Int] {
        var result = [Int]()
        preOrderTraversalHelper(node: root, result: &result)
        return result
    }
    
    public func preOrderTraversalHelper(node: Tree?, result: inout [Int]) {
        guard let node = node else { return }
        
        // add the node value
        result.append(node.value)
        
        // travers left node
        preOrderTraversalHelper(node: node.left, result: &result)
        
        // travers right node
        preOrderTraversalHelper(node: node.right, result: &result)
    }
    
    public func postOrderTraversal(root: Tree?) -> [Int] {
        var result = [Int]()
        postOrderTraversalHelper(node: root, result: &result)
        return result
    }
    
    public func postOrderTraversalHelper(node: Tree?, result: inout [Int]) {
        guard let node = node else { return }
        
        // travers left node
        postOrderTraversalHelper(node: node.left, result: &result)
        
        // travers right node
        postOrderTraversalHelper(node: node.right, result: &result)
        
        // add the node value
        result.append(node.value)
    }
}

public extension Tree {
    func insert(_ value: Int) -> Tree {
        insertHelper(tree: self, value: value)!
    }
    
    func insertHelper(tree: Tree?, value: Int) -> Tree? {
        var root = tree
        
        if root == nil {
            root = Tree(value: value)
            return root
        }
        
        guard let rootValue = root?.value else { return nil }
        if value < rootValue {
            root?.left = insertHelper(tree: root, value: value)
        } else if value > rootValue {
            root?.right = insertHelper(tree: root, value: value)
        }
        
        return root
    }
    
    
    
    // Function to insert multiple values into the tree
    func insertMany(_ values: [Int]) -> Tree {
        var root = self
        for value in values {
            root = root.insert(value)
        }
        return root
    }
}

public extension Tree {
    func height(_ root: Tree?) -> Int {
        if root == nil {
            return 0
        } else {
            let leftHeight = height(root?.left)
            let rightHeight = height(root?.right)
            
            if leftHeight > rightHeight {
                return leftHeight + 1
            } else {
                return rightHeight + 1
            }
        }
    }
}
