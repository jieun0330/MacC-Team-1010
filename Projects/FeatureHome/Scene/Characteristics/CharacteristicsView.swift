//
//  CharacteristicsView.swift
//  FeatureMain
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import FeatureCategory

struct CharacteristicsView: View {
	var body: some View {
		VStack(spacing: 0) {
			NavigationLink {
				CategoryView(type: .characteristics, targetTitle: [])
			} label: {
				HStack(spacing: 4) {
					Text("특징으로 찾기")
						.font(.style(.SF22B))
						.foregroundColor(Color(uiColor: .designSystem(.white)!))
					Image(systemName: "chevron.right")
						.font(.system(size: 22, weight: .bold))
						.foregroundColor(Color(uiColor: .designSystem(.white)!))
					Spacer()
				}
			}
			Spacer()
				.frame(height: 16)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 16) {
					ForEach(CharacteristicsType.allCases, id: \.self) { characteristic in
						NavigationLink {
							CategoryView(type: .characteristics,
										 targetTitle: [characteristic])
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
