//
//  TasteRatingView.swift
//  Common
//
//  Created by Kim SungHun on 2023/10/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct TasteRatingView: View {
	let makgeolliData: MockMakgeolliModel

	public init(makgeolliData: MockMakgeolliModel) {
		self.makgeolliData = makgeolliData
	}

	public var body: some View {
		VStack {
			HStack(spacing: 10) {
				Spacer()
				ForEach(0..<4) { index in
					FlavorRatingView(flavorName: makgeolliData.taste[index].description,
									 tasteRating: makgeolliData.tasteScore[index])
				}
				Spacer()
			}
			.padding()
		}
		.background(Color(uiColor: .designSystem(.blackBlock)!))
		.cornerRadius(10)
	}
}

private extension TasteRatingView {
	@ViewBuilder
	func FlavorRatingView(flavorName: String, tasteRating: Int) -> some View {
		VStack {
			Text(flavorName)
				.bold()
				.font(.system(size: 12))
				.foregroundColor(.white)
			Circle()
				.frame(width: 60, height: 60)
				.foregroundColor(Color(uiColor: .designSystem(.tasteCircle)!).opacity(
					tasteRating == 1 ? 0.2
					: tasteRating == 2 ? 0.4
					: tasteRating == 3 ? 0.6
					: tasteRating == 4 ? 0.8
					: 1.0
				))
				.overlay(
					Text("\(tasteRating)")
						.bold()
						.foregroundColor(.white)
						.font(.system(size: 30))
				)
		}
	}
}
