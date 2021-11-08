//
//  Racing.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/04.
//

import Foundation

final class Racing {
	// MARK: - Properties
	private let randomNumber: Random
	private let resultView: Outputable
	private(set) var cars: [RacingCar] = []
	private var totalTrack: Int = RacingOption.defaultTotalTrack
	private var track: Int = RacingOption.startingTrack
	
	// MARK: - Initialize
	init(inputView: Inputable, resultView: Outputable, random: Random) {
		self.randomNumber = random
		self.resultView = resultView
		do {
			try inputView.read { inputCar, inputAttempt in
				self.totalTrack = inputAttempt.numberOfAttempts
				self.makeRacingCars(inputCar)
			}
		} catch (let error) {
			printMessage(for: error)
		}
	}
	
	// MARK: - Public
	func raceStart() {
		startBroadcasting()
		racing()
		raceEnd()
	}
	
	func awardToWinners() -> [String] {
		cars.filter {
			$0.position.currentPosition == findMaxPosition()
		}.map {
			$0.name
		}
	}
	
	// MARK: - Private
	private func printMessage(for error: Error) {
		if let inputError = error as? InputError {
			resultView.broadcast(asError: inputError)
		}
	}
	
	private func startBroadcasting() {
		resultView.startedBroadcasting()
	}
	
	private func racing() {
		while (track <= totalTrack) {
			cars.forEach { car in
				car.move(at: randomNumber.rand())
				_ = resultView.broadcast(position: car.position.currentPosition, of: car.name)
			}
			passTrack()
		}
	}
	
	private func passTrack() {
		track += 1
		resultView.broadcastThatCarsHasPassedTrack()
	}
	
	private func raceEnd() {
		totalTrack = RacingOption.defaultTotalTrack
		track = RacingOption.startingTrack
	}
	
	private func findMaxPosition() -> Int? {
		cars.max {
			$0.position > $1.position
		}.map {
			$0.position.currentPosition
		}
	}
	
	private func makeRacingCars(_ inputCar: CarInputable) {
		inputCar.carNames.forEach { carName in
			let car = RacingCar(name: carName)
			cars.append(car)
		}
	}
}
