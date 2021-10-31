//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol Calculable {
	func add(_ lhs: Int, _ rhs: Int) -> Int
}

struct Calculator: Calculable {
	func add(_ lhs: Int, _ rhs: Int) -> Int {
		return lhs + rhs
	}
}
