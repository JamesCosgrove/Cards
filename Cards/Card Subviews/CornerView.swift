//
//  CornerView.swift
//  Cards
//
//  Created by James Cosgrove on 04/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct CornerView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	
    var body: some View {
		VStack(spacing: 5) {
			Text("\(value)")
				.font(.system(size: 40, weight: .semibold, design: .serif))
			Image(systemName: "suit.\(suit).fill")
				.font(.system(size: 40))
		}.foregroundColor(color)
		
    }
}

struct CornerView_Previews: PreviewProvider {
    static var previews: some View {
		CornerView(color: .red, value: "5", suit: "diamond")
    }
}
