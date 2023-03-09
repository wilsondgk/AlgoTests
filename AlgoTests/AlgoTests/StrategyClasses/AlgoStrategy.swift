//
//  AlgoStrategy.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 16/02/23.
//

import Foundation
import UIKit

protocol AlgoExampleStrategy: AlgoRunable {
    var group: String { get }
    var title: String { get }
    var link: String { get }
}

protocol AlgoRunable: AnyObject {
    func runAlgo(_ label: UILabel)
}

struct AllStrategies {
    static let list: [AlgoExampleStrategy] = [Prob1781(), Prob1915(), Prob205(), Prob242(), Prob167(), Prob15(), Prob42(), Prob31()]
}
