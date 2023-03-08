//
//  Prob15.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 08/03/23.
//

import Foundation
import UIKit

final class Prob15: AlgoExampleStrategy {
    
    var group: String = "Two Pointer"
    var title: String = "15. 3Sum"
    var link: String = "https://leetcode.com/problems/3sum/"
    
    func runAlgo(_ label: UILabel) {
        label.text = "Solution: \(Solution15().threeSum([-1,0,1,2,-1,-4]))"
//        label.text = "Solution: \(Solution15().threeSum([1,2,-2,-1]))"
//        label.text = "Solution: \(Solution15().threeSum([-1,0,1,2,-1,-4]))"
        
    }
}


final class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 { return  [] }
        let sortedNums = nums.sorted()
        var answer: [[Int]] = []
        print("sortedNums:  \(sortedNums)")
        for firstPointer in 0...(nums.count - 3) {
            if firstPointer > 0, sortedNums[firstPointer] == sortedNums[firstPointer - 1] { continue }
            
            var left = firstPointer + 1
            var right = nums.count - 1
            while left < right {
                let sum = sortedNums[left] + sortedNums[right] + sortedNums[firstPointer]
                if sum > 0 {
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    answer.append([sortedNums[firstPointer], sortedNums[left], sortedNums[right]])
                    left += 1
                }
                while sortedNums[left] == sortedNums[left - 1] && left < right && left - 1 != firstPointer {
                    left += 1
                }
            }
        }
        return answer
    }
}
