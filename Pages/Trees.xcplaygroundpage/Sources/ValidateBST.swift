//
//  ValidateBST.swift
//  
//
//  Created by Rani Badri on 10/12/24.
//

public class ValidateBST {
    public static func validateBST(_ root: Tree?) -> Bool {
        return validateBSTHelper(root, nil, nil)
    }
    
    static func validateBSTHelper(_ root: Tree?, _ lower: Int?, _ upper:Int?) -> Bool  {
        guard let root = root else { return true }
        
        let value = root.value
        
        if let lower = lower, value <= lower { return false }
        
        if let upper = upper, value >= upper { return false }
        
        if !validateBSTHelper(root.left, lower, value) { return false }
        
        if !validateBSTHelper(root.right, value, upper) { return false }
        
        return true
    }
}
