//
//  Prob42.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 08/03/23.
//

import Foundation
import UIKit

final class Prob42: AlgoExampleStrategy {
    
    var group: String = "Two Pointer"
    var title: String = "42. Trapping Rain Water"
    var link: String = "https://leetcode.com/problems/trapping-rain-water/description/"
    
    func runAlgo(_ label: UILabel) {
        label.text = "Water trapped: \(Solution42().trap([4,2,0,3,2,5]))"
//        label.text = "Water trapped: \(Solution42().trap([0,1,0,2,1,0,1,3,2,1,2,1]))"
        
    }
}


final class Solution42 {
    
    func trap(_ height: [Int]) -> Int {
        if height.count < 3 { return 0 }
        guard let firstItem = height.first, let lastItem = height.last else {
            return 0
        }
        var leftMax: [Int] = [firstItem]
        var rightMax: [Int] = [lastItem]
        
        for heightValue in height.dropFirst() {
            if let lastLeftMax = leftMax.last {
                if lastLeftMax > heightValue {
                    leftMax.append(lastLeftMax)
                } else {
                    leftMax.append(heightValue)
                }
            }
        }
        
        for heightValue in height.reversed().dropFirst() {
            if let lastRightMax = rightMax.first {
                if lastRightMax > heightValue {
                    rightMax.insert(lastRightMax, at: 0)
                } else {
                    rightMax.insert(heightValue, at: 0)
                }
            }
        }
        
        print(height)
        print(leftMax)
        print(rightMax)
        var waterSum = 0
        for (index, heightValue) in height.enumerated() {
            let maxHeight = min(leftMax[index], rightMax[index])
            let accumulatedWater = max(maxHeight - heightValue, 0)
            waterSum += accumulatedWater
        }
        
        return waterSum
    }
}
