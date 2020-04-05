//
//  ContentView.swift
//  Cards
//
//  Created by James Cosgrove on 04/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var services = CardServices()
	@State var showOptions = false
	let generator = UINotificationFeedbackGenerator()
    var body: some View {
		VStack {
			StackView(cards: $services.cardList)
			Button(action: {
				self.services.shuffle()
				self.generator.notificationOccurred(.error)
			}, label: {
				Text("Shuffle")
					.font(.system(size: 30, weight: .semibold, design: .serif))
					.foregroundColor(Color(UIColor.label))
			}).padding(.top, 50)
		}.sheet(isPresented: $showOptions, content: {
			OptionsView()
		})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
