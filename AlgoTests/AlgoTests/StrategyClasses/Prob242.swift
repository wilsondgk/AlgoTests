//
//  Prob242.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 07/03/23.
//

import Foundation
import UIKit

final class Prob242: AlgoExampleStrategy {
    
    var group: String = "String Problems"
    var title: String = "242. Valid Anagram"
    var link: String = "https://leetcode.com/problems/valid-anagram/"
    
    func runAlgo(_ label: UILabel) {
        label.text = "Is anagram: \(Solution242().isAnagram("cat", "car"))"
    }
    
    
}

class Solution242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var sDict: [Character: Int] = [:]
        var tDict: [Character: Int] = [:]
        for char in s {
            if let existingChar = sDict[char] {
                sDict[char] = existingChar + 1
            } else {
                sDict[char] = 1
            }
        }
        
        for char in t {
            if let existingChar = tDict[char] {
                tDict[char] = existingChar + 1
            } else {
                tDict[char] = 1
            }
        }
        for item in sDict {
            if tDict[item.key] != item.value {
                return false
            }
        }
        return true
    }
}
