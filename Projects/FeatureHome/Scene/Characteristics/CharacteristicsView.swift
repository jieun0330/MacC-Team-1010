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
	var body: some View {
		VStack(spacing: 0) {
			HStack(spacing: 4) {
				Text("특징으로 찾기")
					.font(.system(size: 22, weight: .bold))
					.foregroundColor(.white)
				Image(systemName: "chevron.right")
					.font(.system(size: 22, weight: .bold))
				Spacer()
			}
			Spacer()
				.frame(height: 16)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 16) {
					ForEach(CharacteristicsType.allCases, id: \.self) { characteristic in
						NavigationLink {
							//								CategoryListView(
							//									type: .characteristics,
							//									targetTitle: characteristic.description
							//								)
						} label: {
							CharacteristicsSingleView(
								title: characteristic.description,
								image: characteristic.characteristicsImage
							)
						}
					}
				}
			}
		}
		.padding(.leading, 16)
	}
}
