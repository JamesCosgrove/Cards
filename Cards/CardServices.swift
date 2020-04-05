//
//  CardServices.swift
//  Cards
//
//  Created by James Cosgrove on 04/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class CardServices: ObservableObject {
	
	@Published var cardList = [Card]()
	
	var runBefore = false
	
	init() {
		shuffle()
	}
	
	func shuffle() {
		
		let suits = ["diamond", "heart", "club", "spade"]
		let values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
		var cards = [Card]()
		print("shuffling")
		for suit in suits {
			for value in values {
				var color: Color
				if suit == "diamond" || suit == "heart" {
					color = Color.red
				}
				else {
					color = Color.black
				}
				cards.append(Card(color: color, value: value, suit: suit))
			}
		}
		cardList = cards.shuffled()
	}
	
}
