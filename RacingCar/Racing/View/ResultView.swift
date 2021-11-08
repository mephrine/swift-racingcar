//
//  ResultView.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

protocol Outputable {
	func startedBroadcasting()
	func broadcast(position: Int, of name: String) -> String
	func broadcast(asError error: InputError)
	func broadcastThatCarsHasPassedTrack()
}

extension Outputable {
	func changePositionToSymbolText(position: Int) -> String {
		var displayingSymbolText = ""
		for _ in 0 ..< position {
			displayingSymbolText.append(RacingOption.outputSymbol)
		}
		return displayingSymbolText
	}
}

struct ResultView: Outputable {
	func startedBroadcasting() {
		print("\n실행 결과")
	}
	
	func broadcast(position: Int, of name: String) -> String {
		let displayingSymbolText = changePositionToSymbolText(position: position)
		printResultPosition(of: name, asSymbol: displayingSymbolText)
		return displayingSymbolText
	}
	
	func broadcastThatCarsHasPassedTrack() {
		print("")
	}
	
	func broadcast(asError inputError: InputError) {
		switch inputError {
		case .invalid:
			print("올바른 숫자를 입력해주세요.")
		case .outOfMaxLength:
			print("자동차 이름은 5자를 초과할 수 없습니다.")
		}
	}
	
	private func printResultPosition(of name: String, asSymbol symbols: String) {
		print("\(name) : \(symbols)")
	}
}
