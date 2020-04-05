//
//  StackView.swift
//  Cards
//
//  Created by James Cosgrove on 04/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct StackView: View {
	@ObservedObject var services = CardServices()
	
	@State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
	
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
						.onEnded{_ in
							self.services.cardList = self.f(self.services.cardList)
						}
		
		return ZStack {
			ForEach(services.cardList, id: \.self) { card in
				CardView(color: card.color, value: card.value, suit: card.suit)
					.rotationEffect(Angle(degrees: Double.random(in: -5...5)))
				.gesture(gesture)
					.animation(.spring())
					.offset(x: card == self.services.cardList[self.services.cardList.count - 1] ? self.viewState.width + self.dragState.translation.width * 1 : self.viewState.width - self.dragState.translation.width * 1, y: card == self.services.cardList[self.services.cardList.count - 1] ? self.viewState.height + self.dragState.translation.height * 1 : self.viewState.height - self.dragState.translation.height * 1)
				
			}
		}
    }
	func f(_ list: [Card]) -> [Card] {
        var a = list
        let b = a.removeLast()
        a.insert(b, at: 0 )
        return a
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
