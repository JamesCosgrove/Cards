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
    var body: some View {
		VStack {
			StackView()
			Button(action: {
				self.services.shuffle()
			}, label: {
				Text("Shuffle")
					.font(.system(size: 30, weight: .semibold, design: .serif))
					.foregroundColor(Color(UIColor.label))
			}).padding(.top, 50)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
