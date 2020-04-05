//
//  StackView.swift
//  Cards
//
//  Created by James Cosgrove on 04/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct StackView: View {
	@Binding var cards: [Card]
	let generator = UINotificationFeedbackGenerator()
	@State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
	@State private var cardSwap = false
	@State var showBack = false
	
	enum DragState {
        case inactive
        case active(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .active(let t):
                return t
            }
        }

        var isActive: Bool {
            switch self {
            case .inactive: return false
            case .active: return true
            }
        }
    }
    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero
	
    var body: some View {
		
		let gesture = DragGesture()
						.updating($dragState) { (value, dragInfo, _) in
							dragInfo = .active(translation: value.translation)
						}
						.onEnded{ value in
							self.cards = self.f(self.cards)
							let impactLight = UIImpactFeedbackGenerator(style: .light)
							impactLight.impactOccurred()
							
						}
		
		
		return ZStack {
			ForEach(cards, id: \.self) { card in
				CardView(color: card.color, value: card.value, suit: card.suit, showBack: self.$showBack)
					.rotationEffect(Angle(degrees: !self.dragState.isActive ? (card != self.cards[self.cards.count - 1] ? Double.random(in: -5...5) : 0) : 0))
				
				.gesture(gesture)
					
					.offset(x: card == self.cards[self.cards.count - 1] ? self.viewState.width + self.dragState.translation.width * 1 : self.viewState.width - self.dragState.translation.width * 1.5 ,
							y: card == self.cards[self.cards.count - 1] ? self.viewState.height + self.dragState.translation.height * 1 : self.viewState.height - self.dragState.translation.height * 1.5)
					.rotation3DEffect(Angle(degrees: self.angleToRotate(card: card)), axis: (x: 0, y: 1, z: 0))
				.animation(.spring())
			}
		}
	.onTapGesture(perform: {
		self.showBack.toggle()
		
	})
		
    }
	func f(_ list: [Card]) -> [Card] {
        var a = list
        let b = a.removeLast()
        a.insert(b, at: 0 )
        return a
    }
	func angleToRotate(card: Card) -> Double {
		if card == self.cards[self.cards.count - 1] {
			if dragState.isActive {
				if dragState.translation.width > 0 {
					return -15
				}
				else {
					return 15
				}
			}
		}
		else {
			if dragState.isActive {
				if dragState.translation.width > 0 {
					return 5
				}
				else {
					return -5
				}
			}
		}
		return 0
	}
	
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
		StackView(cards: .constant([Card]()))
    }
}
