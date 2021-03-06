//
//  CardView.swift
//  Cards
//
//  Created by James Cosgrove on 04/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct CardView: View {
	@State var color: Color
	@State var value: String
	@State var suit: String
	@Binding var showBack: Bool
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 30)
				.foregroundColor(.white)
			VStack {
				HStack {
					CornerView(color: color, value: value, suit: suit)
					Spacer()
				}.padding([.leading, .top])
				Spacer(minLength: 0)
				CentralView(color: color, value: value, suit: suit)
				Spacer(minLength: 0)
				HStack {
					Spacer()
					CornerView(color: color, value: value, suit: suit)
					.rotationEffect(Angle(degrees: 180))
				}.padding([.trailing, .bottom])
			}
			if showBack {
				BackView()
			}
		}.frame(width: 263, height: 375, alignment: .center)
		.overlay(
			RoundedRectangle(cornerRadius: 30)
				
				.stroke(Color(UIColor.black), lineWidth: 5)
		)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(color: .red, value: "A", suit: "heart", showBack: .constant(false))
    }
}

extension UIColor {
    func inverse () -> UIColor {
        var r:CGFloat = 0.0; var g:CGFloat = 0.0; var b:CGFloat = 0.0; var a:CGFloat = 0.0;
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: 1.0-r, green: 1.0 - g, blue: 1.0 - b, alpha: a)
        }
        return .black // Return a default colour
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
