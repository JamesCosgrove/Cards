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

struct CentralView_Previews: PreviewProvider {
    static var previews: some View {
		CentralView(color: .red, value: "5", suit: "diamond")
    }
}
