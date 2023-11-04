//
//  TasteGraphView.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/04.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct TasteGraphView: View {
	let scores: [Int]
	
	public init (scores: [Int]) {
		self.scores = scores
	}
	
	public var body: some View {
		HStack(spacing: 4) {
			ForEach(scores, id: \.self) { score in
				switch score {
				case 0:
					Image(uiImage: .designSystem(.graph0)!)
				case 1:
					Image(uiImage: .designSystem(.graph1)!)
				case 2:
					Image(uiImage: .designSystem(.graph2)!)
				case 3:
					Image(uiImage: .designSystem(.graph3)!)
				case 4:
					Image(uiImage: .designSystem(.graph4)!)
				case 5:
					Image(uiImage: .designSystem(.graph5)!)
				default:
					Image(uiImage: .designSystem(.graphNull)!)
				}
			}
		}
	}
}
