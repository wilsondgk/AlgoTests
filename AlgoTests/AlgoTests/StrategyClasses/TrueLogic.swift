//
//  TrueLogic.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 06/03/23.
//

import Foundation

/**
 *
 * Given a list and chunk size, divide the list into multiple sub lists
 * where each sub-list is of length of chunk size.
 *
 * chunk([1, 2, 3, 4], 2) --> [[ 1, 2], [3, 4]]
 * chunk([1, 2, 3, 4, 5], 2) --> [[ 1, 2], [3, 4], [5]]
 * chunk([1, 2, 3, 4, 5, 6, 7, 8], 3) --> [[ 1, 2, 3], [4, 5, 6], [7, 8]]
 * chunk([1, 2, 3, 4, 5], 4) --> [[ 1, 2, 3, 4], [5]]
 * chunk([1, 2, 3, 4, 5], 10) --> [[ 1, 2, 3, 4, 5]]
 *
 */




class TrueLogic {
    
    func GasStation(_ strArr: [String]) -> String {

      // code goes here
      // Note: feel free to modify the return type of this function

      let numberOfStations = Int(strArr[0]) ?? 0
      var startingIndex = 1
        var loopingList = strArr.map { $0 }
        
      var remainingGas = 0
        var hasAnswer = true
        
        while startingIndex <= numberOfStations {
            print("=========")
            print("Iteration Number \(startingIndex)")
            print("loopingList \(loopingList)")
            hasAnswer = true
            remainingGas = 0
            for index in 1...numberOfStations {
                
                let tuple = loopingList[index].getGasAndDistance()
                let remainingGasInCurrentStation = tuple.0 - tuple.1
                print(tuple)
                print("This station uses \(remainingGasInCurrentStation)")
                remainingGas += remainingGasInCurrentStation
                print("remainingGas \(remainingGas)")
                if remainingGas < 0 {
                    print("Not enought gas to next \(remainingGas)")
                    startingIndex += 1
                    remainingGas = 0
                    let saveFirstElement = loopingList[1]
                    loopingList.remove(at: 1)
                    loopingList.append(saveFirstElement)
                    print("New loopingList \(loopingList)")
                    hasAnswer = false
                    break
                }
            }
            if hasAnswer {
                return String(startingIndex)
            }
        }
      
      return "impossible"

    }
}
extension String {
  func getGasAndDistance() -> (gas: Int, distance: Int) {
    let stringList = self.components(separatedBy: ":")
    let gas = Int(stringList[0]) ?? 0
    let distance = Int(stringList[1]) ?? 0
    return (gas: gas, distance: distance)
  }
}
