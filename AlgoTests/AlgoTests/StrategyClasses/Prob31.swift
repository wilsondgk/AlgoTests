//
//  Prob31.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 09/03/23.
//

import Foundation
import UIKit

final class Prob31: AlgoExampleStrategy {
    
    var group: String = "Two Pointer"
    var title: String = "31. Next Permutation"
    var link: String = "https://leetcode.com/problems/next-permutation/description/"
    
        var array = [0, 1, 2, 5, 3, 3, 0]
//        var array = [5,4,7,5,3,2]
    
    func runAlgo(_ label: UILabel) {
        
        Solution31().nextPermutation(&array)
        label.text = "NextPerm: \(array)"
    }
}

final class Solution31 {
    
    func nextPermutation(_ nums: inout [Int]) {
        var leftPivot = nums.count - 1
        while leftPivot > 0, nums[leftPivot - 1] >= nums[leftPivot] {
            leftPivot -= 1
        }
        if leftPivot == 0 {
            nums = nums.reversed()
            return
        }
        leftPivot -= 1
        var rightPivot = nums.count - 1
        while nums[leftPivot] >= nums[rightPivot] {
            rightPivot -= 1
        }
        print("left pivot: \(leftPivot)")
        print("right pivot: \(rightPivot)")
        
        //switch pivots
        let temp = nums[rightPivot]
        nums[rightPivot] = nums[leftPivot]
        nums[leftPivot] = temp
        print("Pivoted to: \(nums)")
        let ascendingNums: [Int]
        if nums.count - leftPivot - 2 > 0 {
            ascendingNums = Array( nums.dropFirst((leftPivot + 1)).reversed())
        } else {
            ascendingNums = [nums.last!]
        }
            
        print("count : \(nums.count - leftPivot - 2)")
        print("ascendingNums : \(ascendingNums)")
        nums = nums.prefix(leftPivot + 1) + ascendingNums
        print("new : \(nums)")
    }
}
