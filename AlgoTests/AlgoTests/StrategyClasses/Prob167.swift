//
//  Prob167.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 08/03/23.
//

import Foundation
import UIKit

final class Prob167: AlgoExampleStrategy {
    
    var group: String = "Two Pointer"
    var title: String = "167. Two Sum II - Input Array Is Sorted"
    var link: String = "https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/"
    
    func runAlgo(_ label: UILabel) {
        let solution = Solution167().twoSum([2,3,4], 6)
        label.text = "Solution: \(solution)"
    }
}

final class Solution167 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        if numbers.count < 2 { return [] }
        return recursive(0, right: (numbers.count - 1), numbers: numbers, target: target)
    }
    
    private func recursive(_ left: Int, right: Int, numbers: [Int], target: Int) -> [Int] {
        guard numbers.indices.contains(left), numbers.indices.contains(right) else {
            return []
        }
        if numbers[left] + numbers[right] == target { return [left + 1, right + 1 ] }
        
        if numbers[left] + numbers[right] > target { return recursive(left, right: right - 1, numbers: numbers, target: target) }
        if numbers[left] + numbers[right] < target { return recursive(left + 1, right: right, numbers: numbers, target: target) }
        return []
    }
}

