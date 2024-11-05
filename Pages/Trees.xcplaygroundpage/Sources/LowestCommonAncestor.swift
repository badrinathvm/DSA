//
//  LowestCommonAncestor.swift
//  
//
//  Created by Rani Badri on 11/4/24.
//

public class LowestCommonAncestor {
    public init() {}
    
    public func lca(_ root: Tree?, _ p: Tree?, _ q: Tree?) -> Tree? {
        // Base Condition: if root is nil, or root is one of p or q, return root
        if root == nil || root == p || root == q {
            return root
        }
        
        let leftLCA = lca(root?.left, p, q)
        let rightLCA = lca(root?.right, p, q)
        
        if leftLCA != nil && rightLCA != nil {
            return root
        }
        
        return leftLCA != nil ? leftLCA : rightLCA
    }
}
