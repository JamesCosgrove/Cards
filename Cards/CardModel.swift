//
//  CardModel.swift
//  Cards
//
//  Created by James Cosgrove on 04/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation
import SwiftUI

struct Card: Hashable {
	var color: Color
	var value: String
	var suit: String
}
