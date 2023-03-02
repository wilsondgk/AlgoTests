//
//  Prob1915.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 02/03/23.
//

import Foundation
import UIKit

class Prob1915: AlgoExampleStrategy {
    
    let group: String = "String Problems"
    let title: String = "1915. Number of Wonderful Substrings"
    let link: String = "https://leetcode.com/problems/number-of-wonderful-substrings/"
        
    func runAlgo(_ label: UILabel) {
        label.text = "Sum: \(String(Solution1915().wonderfulSubstrings("aabcb")))"
    }
}

class Solution1915 {
    func wonderfulSubstrings(_ word: String) -> Int {
        if word.count == 1 { return 1 }
        
        var substringCount = word.count
        
        for firstPointer in 0...(word.count - 2) {
            for secondPointer in (firstPointer + 1)...(word.count - 1) {
                let newStr = word.substring(from: firstPointer, to: secondPointer)
                if isWonderful(newStr) {
                    substringCount += 1
                }
            }
        }
        return substringCount
    }
}

extension String {
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start...end])
    }

    func substring(range: NSRange) -> String {
        return substring(from: range.lowerBound, to: range.upperBound)
    }
}

func isWonderful(_  str: String) -> Bool {
    if str.count == 0 { return false }
    if str.count == 1 { return true }
    var charsDict: [Character: Int] = [:]
    for char in str {
        if let existingCharCount = charsDict[char] {
            charsDict[char] = existingCharCount + 1
        } else {
            charsDict[char] = 1
        }
    }
    for value in charsDict.values {
        if value % 2 == 0 { return true }
    }
    return false
}
