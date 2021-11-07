//
//  RacingCar.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/03.
//

import Foundation

struct Position {
	private(set) var currentPosition: Int
	private let movementRange: ClosedRange<Int>
	
	init(position: Int, range: ClosedRange<Int>) {
		self.currentPosition = position
		self.movementRange = range
	}
	
	mutating func increase(at position: Int) {
		if movementRange.contains(position) {
			self.currentPosition += 1
		}
	}
}

final class RacingCar {
	private(set) var position: Position = Position(position: RacingOption.defaultRacingCarposition, range: RacingOption.movementRange)
	
	func move(at score: Int) {
		position.increase(at: score)
	}
}
