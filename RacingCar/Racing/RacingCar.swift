//
//  RacingCar.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/03.
//

import Foundation

class RacingCar {
	private(set) var position: Int = 0
	
	func move(at score: Int) {
		if score > 4 {
			position += 1
		}
	}
}