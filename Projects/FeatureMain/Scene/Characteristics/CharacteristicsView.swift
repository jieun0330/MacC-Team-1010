//
//  CharacteristicsView.swift
//  FeatureMain
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct CharacteristicsView: View {
	
	private let characteristicsGroup = stride(from: 0,
											  to: CharacteristicsType.allCases.count,
											  by: 2).map { startIndex in
		Array(CharacteristicsType.allCases[
			startIndex..<min(startIndex + 2, CharacteristicsType.allCases.count)
		])
	}
	
	var body: some View {
		VStack(spacing: 0) {
			HStack(spacing: 0) {
				Text("특징")
					.font(.system(size: 18, weight: .bold))
					.foregroundColor(.white)
				Text("으로 찾기")
					.font(.system(size: 18, weight: .regular))
					.foregroundColor(.white)
				Spacer()
			}
			Spacer()
				.frame(height: 16)
			ScrollView(.horizontal, showsIndicators: false) {
				ForEach(characteristicsGroup, id: \.self) { characteristics in
					HStack {
						ForEach(characteristics, id: \.self) { characteristic in
							CharacteristicsSingleView(
								title: characteristic.description,
								color: characteristic.emphasisColor
							).frame(width: 200)
						}
					}
				}
			}
		}
		.padding(.leading, 16)
	}
}

struct CharacteristicsView_Previews: PreviewProvider {
	static var previews: some View {
		CharacteristicsView()
	}
}
