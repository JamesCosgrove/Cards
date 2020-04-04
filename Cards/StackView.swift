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
	
    var body: some View {
		ZStack {
			ForEach(services.cardList, id: \.self) { card in
				CardView(color: card.color, value: card.value, suit: card.suit)
					.rotationEffect(Angle(degrees: Double.random(in: -5...5)))
					.offset(x: CGFloat.random(in: -5...5) + self.currentPosition.width, y: CGFloat.random(in: -5...5) + self.currentPosition.height)
					.animation(.spring())
				.gesture(DragGesture()
					.onChanged { value in
							self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
					}   // 4.
					.onEnded { value in
						self.services.shuffle()
						self.currentPosition = CGSize(width: 0, height: 0)
						self.newPosition = self.currentPosition
					}
				)
			}
		}
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
