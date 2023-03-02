//
//  Prob1781.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 16/02/23.
//

import Foundation
import UIKit

class Prob1781: AlgoExampleStrategy {
    
    let group: String = "String Problems"
    let title: String = "1781. Sum of Beauty of All Substrings"
    let link: String = "https://leetcode.com/problems/sum-of-beauty-of-all-substrings/"
    
    func runAlgo(_ label: UILabel) {
        label.text = String(Solution1781().beautySum("xbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbbxbb"))
    }
}

class Solution1781 {
    func beautySum(_ s: String) -> Int {
        
        var sum = 0
        var charCountDict: [String: Int] = [:]
        let charsArray = Array(s)
        for firstPointer in 0...(s.count - 1) {
            charCountDict = [:]
            for secondPointer in (firstPointer)...(s.count - 1) {
                let char = String(charsArray[secondPointer])
                if let existingCharCount = charCountDict[char] {
                    let newCount = existingCharCount + 1
                    charCountDict[char] = newCount
                } else {
                    charCountDict[char] = 1
                }
                
                let substring = s.substring(from: firstPointer, to: secondPointer)
                print("substring: \(substring)")
                print("calculateValue: \(calculateValue(charCountDict))")
                print("charCountDict: \(charCountDict)")
                print("\n")
                sum += calculateValue(charCountDict)
            }
        }
        print("sum: \(sum)")
        return sum
    }
    
    private func calculateValue(_ dict: [String: Int]) -> Int {
        var minimumCount = Int.max
        var maxCount = Int.min
        for count in dict.values {
            if count > maxCount {
                maxCount = count
            }
            if count < minimumCount {
                minimumCount = count
            }
        }
        return maxCount - minimumCount
    }
}
