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
	private let taste = ["단", "신", "걸", "탄"]
	private let scores: [Double]
	
	public init (scores: [Double]) {
		self.scores = scores
	}
	
	public var body: some View {
		HStack(spacing: 4) {
			ForEach(0..<scores.count, id: \.self) { index  in
				let score = scores[index]
				let taste = taste[index]
				switch score {
				case 0.0..<1.0:
					VStack(spacing: 4) {
						Image(uiImage: .designSystem(.graph0)!)
						Text(taste)
							.SF10B()
							.foregroundColor(.W50)
					}
				case 1.0..<2.0:
					VStack(spacing: 4) {
						Image(uiImage: .designSystem(.graph1)!)
						Text(taste)
							.SF10B()
							.foregroundColor(.W50)
					}
				case 2.0..<3.0:
					VStack(spacing: 4) {
						Image(uiImage: .designSystem(.graph2)!)
						Text(taste)
							.SF10B()
							.foregroundColor(.W50)
					}
				case 3.0..<4.0:
					VStack(spacing: 4) {
						Image(uiImage: .designSystem(.graph3)!)
						Text(taste)
							.SF10B()
							.foregroundColor(.W50)
					}
				case 4.0..<5.0:
					VStack(spacing: 4) {
						Image(uiImage: .designSystem(.graph4)!)
						Text(taste)
							.SF10B()
							.foregroundColor(.W50)
					}
				case 5.0:
					VStack(spacing: 4) {
						Image(uiImage: .designSystem(.graph5)!)
						Text(taste)
							.SF10B()
							.foregroundColor(.W50)
					}
				default:
					VStack(spacing: 4) {
						Image(uiImage: .designSystem(.graphNull)!)
						Text(taste)
							.SF10B()
							.foregroundColor(.W50)
					}
				}
			}
		}
	}
}
