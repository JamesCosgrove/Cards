//
//  BackView.swift
//  Cards
//
//  Created by James Cosgrove on 05/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct BackView: View {
	var suits = ["heart", "diamond", "club", "spade"]
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 30)
			.foregroundColor(.white)
			RoundedRectangle(cornerRadius: 20)
			.foregroundColor(.red)
				.frame(width: UIScreen.screenWidth * 0.65, height: UIScreen.screenWidth * 0.95, alignment: .center)
			Group {
				VStack {
					HStack {
						Image(systemName: "suit.club.fill")
							.font(.system(size: 30))
							.rotationEffect(Angle(degrees: -45), anchor: .center)
							.frame(width: 30, height: 30, alignment: .center)
						Image(systemName: "suit.heart.fill")
							.font(.system(size: 28))
							.rotationEffect(Angle(degrees: 45), anchor: .center)
							.frame(width: 30, height: 30, alignment: .center)
					}
					HStack {
						Image(systemName: "suit.diamond.fill")
							.font(.system(size: 30))
							.rotationEffect(Angle(degrees: -135), anchor: .center)
							.frame(width: 30, height: 30, alignment: .center)
						Image(systemName: "suit.spade.fill")
							.font(.system(size: 30))
							.rotationEffect(Angle(degrees: 135), anchor: .center)
							.frame(width: 30, height: 30, alignment: .center)
					}
				}.foregroundColor(.white)
			}
		}
    }
}

struct BackView_Previews: PreviewProvider {
    static var previews: some View {
        BackView()
    }
}
