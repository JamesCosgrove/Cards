//
//  CentralView.swift
//  Cards
//
//  Created by James Cosgrove on 04/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct CentralView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	
    var body: some View {
		VStack {
			if Int(value) ?? 0 == 0 {
				SpecialCard(color: color, value: value, suit: suit)
			}
			else if Int(value) == 3 {
				ThreeView(color: self.color, value: self.value, suit: self.suit)
			}
			else if Int(value) == 6 {
				HStack {
					Spacer()
					ThreeView(color: self.color, value: self.value, suit: self.suit)
					Spacer(minLength: 70)
					ThreeView(color: self.color, value: self.value, suit: self.suit)
					Spacer()
				}
			}
			else if Int(value) == 2  {
					TwoView(color: self.color, value: self.value, suit: self.suit)
			}
			else if Int(value) == 4  {
				HStack {
					Spacer()
					TwoView(color: self.color, value: self.value, suit: self.suit)
					Spacer(minLength: 70)
					TwoView(color: self.color, value: self.value, suit: self.suit)
					Spacer()
				}
			}
			else if Int(value) == 5 {
				FiveView(color: self.color, value: self.value, suit: self.suit)
			}
			else if Int(value) == 7 {
				SevenView(color: self.color, value: self.value, suit: self.suit)
			}
			else if Int(value) == 8 {
				EightView(color: self.color, value: self.value, suit: self.suit)
			}
			else if Int(value) == 9 {
				NineView(color: self.color, value: self.value, suit: self.suit)
			}
			else if Int(value) == 10 {
				TenView(color: self.color, value: self.value, suit: self.suit)
			}
		}.frame(width: UIScreen.screenWidth * 0.4, height: UIScreen.screenWidth * 0.5, alignment: .center)
		
    }
}

struct SpecialCard: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	var body: some View {
		ZStack {
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 180))
				
			Text("\(value)")
				.foregroundColor(.white)
				.font(.system(size: 70, weight: .semibold, design: .serif))
		}
	}
}
struct ThreeView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	var body: some View {
		VStack {
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
			Spacer(minLength: 70)
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
			Spacer(minLength: 70)
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
				.rotationEffect(Angle(degrees: 180))
		}
	}
}
struct TwoView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	var body: some View {
		VStack {
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
			Spacer(minLength: 140)
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
				.rotationEffect(Angle(degrees: 180))
		}
	}
}
struct FiveView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	var body: some View {
		HStack {
			Spacer()
			TwoView(color: color, value: value, suit: suit)
			Spacer()
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
			Spacer()
			TwoView(color: color, value: value, suit: suit)
			Spacer()
		}
//		VStack {
//			HStack {
//				Spacer()
//				Image(systemName: "suit.\(suit).fill")
//				.foregroundColor(color)
//				.font(.system(size: 40))
//				Spacer()
//				Image(systemName: "suit.\(suit).fill")
//				.foregroundColor(color)
//				.font(.system(size: 40))
//				Spacer()
//			}
//			Spacer(minLength: 70)
//			HStack {
//				Image(systemName: "suit.\(suit).fill")
//				.foregroundColor(color)
//				.font(.system(size: 40))
//			}
//			Spacer(minLength: 70)
//			HStack {
//				Spacer()
//				Image(systemName: "suit.\(suit).fill")
//				.foregroundColor(color)
//				.font(.system(size: 40))
//				Spacer()
//				Image(systemName: "suit.\(suit).fill")
//				.foregroundColor(color)
//				.font(.system(size: 40))
//				Spacer()
//			}.rotationEffect(Angle(degrees: 180))
//
//		}
	}
}
struct SevenView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	var body: some View {
		HStack {
			Spacer()
			ThreeView(color: color, value: value, suit: suit)
			Spacer()
			VStack {
				Spacer()
				Image(systemName: "suit.\(suit).fill")
					.foregroundColor(color)
					.font(.system(size: 40))
				Spacer(minLength: 140)
				
			}
			Spacer()
			ThreeView(color: color, value: value, suit: suit)
			Spacer()
		}
	}
}
struct EightView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	var body: some View {
		HStack {
			Spacer()
			ThreeView(color: color, value: value, suit: suit)
			Spacer()
			VStack {
				Spacer()
				Image(systemName: "suit.\(suit).fill")
					.foregroundColor(color)
					.font(.system(size: 40))
				Spacer(minLength: 70)
				Image(systemName: "suit.\(suit).fill")
					.foregroundColor(color)
					.font(.system(size: 40))
					.rotationEffect(Angle(degrees: 180))
				Spacer()
			}
			Spacer()
			ThreeView(color: color, value: value, suit: suit)
			Spacer()
		}
	}
}
struct NineView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	var body: some View {
		HStack {
			Spacer()
			FourVerticalView(color: color, value: value, suit: suit)
			Spacer()
			VStack {
				Spacer()
				Image(systemName: "suit.\(suit).fill")
					.foregroundColor(color)
					.font(.system(size: 40))
				Spacer(minLength: 170)
			}
			Spacer()
			FourVerticalView(color: color, value: value, suit: suit)
			Spacer()
		}
	}
}
struct TenView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	var body: some View {
		HStack {
			Spacer()
			FourVerticalView(color: color, value: value, suit: suit)
			Spacer()
			VStack {
				Spacer()
				Image(systemName: "suit.\(suit).fill")
					.foregroundColor(color)
					.font(.system(size: 40))
				Spacer(minLength: 90)
				Image(systemName: "suit.\(suit).fill")
					.foregroundColor(color)
					.font(.system(size: 40))
					.rotationEffect(Angle(degrees: 180))
				Spacer()
			}
			Spacer()
			FourVerticalView(color: color, value: value, suit: suit)
			Spacer()
		}
	}
}

struct FourVerticalView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	var body: some View {
		VStack {
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
			Spacer(minLength: 40)
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
			Spacer(minLength: 40)
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
				.rotationEffect(Angle(degrees: 180))
			Spacer(minLength: 40)
			Image(systemName: "suit.\(suit).fill")
				.foregroundColor(color)
				.font(.system(size: 40))
				.rotationEffect(Angle(degrees: 180))
		}
	}
}

struct CentralView_Previews: PreviewProvider {
    static var previews: some View {
		CentralView(color: .red, value: "3", suit: "diamond")
    }
}

//	func makeLayout(value: String, color: Color, suit: String) -> some View{
//		let number = Int(value) ?? 0
//		if number != 0 {
//			let array = divWithRemainder(number: number, divider: 2)
//			let x = array[0]
//			let y = array[1]
//			let arrayTwo = divWithRemainder(number: x, divider: 2)
//			let a = arrayTwo[0]
//			let b = array[1]
//			if y == 1 {
//				//place one in centre of card
//
//			}
//			else {
//
//			}
//		}
//		return SpecialCard(color: color, value: value, suit: suit)
//
//	}
//	func divWithRemainder(number: Int, divider: Int) -> [Int] {
//		return [Int(floor(Double(number / divider))), Int(number % 2)]
//	}
