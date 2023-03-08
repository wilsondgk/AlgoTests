//
//  Prob205.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 02/03/23.
//

import Foundation
import UIKit

class Prob205: AlgoExampleStrategy {
    
    var group: String = "String Problems"
    var title: String = "205. Isomorphic Strings"
    var link: String = "https://leetcode.com/problems/isomorphic-strings/"
    
    func runAlgo(_ label: UILabel) {
        label.text = "isIsomorphic: \(String(Solution205().isIsomorphic("badc", "baba")))"
    }
}

class Solution205 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let sArray = Array(s)
        let tArray = Array(t)
        //Key is a character of S and Value is the substitute in T
        var sRepeatDict: [Character: Character] =  [:]
        //Key is a character of T and Value is the substitute in S
        var tRepeatDict: [Character: Character] =  [:]
        if sArray.count != tArray.count { return false }
        for i in 0...(sArray.count - 1) {
            if let pairChar = sRepeatDict[sArray[i]] {
                if pairChar != tArray[i] { return false }
            } else {
                sRepeatDict[sArray[i]] = tArray[i]
            }
            
            if let pairChar = tRepeatDict[tArray[i]] {
                if pairChar != sArray[i] { return false }
            } else {
                tRepeatDict[tArray[i]] = sArray[i]
            }
        }
        return true
        
        
//        let sArray = Array(s)
//        let tArray = Array(t)
//        var sRepeatDict: [Character: Int] =  [:]
//        var tRepeatDict: [Character: Int] =  [:]
//        if sArray.count != tArray.count { return false }
//        for i in 0...(sArray.count - 1) {
//            if let existingCount = sRepeatDict[sArray[i]] {
//                sRepeatDict[sArray[i]] = existingCount + 1
//            } else {
//                sRepeatDict[sArray[i]] = 1
//            }
//            if let existingCount = tRepeatDict[tArray[i]] {
//                tRepeatDict[tArray[i]] = existingCount + 1
//            } else {
//                tRepeatDict[tArray[i]] = 1
//            }
//
//            if tRepeatDict[tArray[i]] != sRepeatDict[sArray[i]] { return false }
//        }
//        return true
    }
}



