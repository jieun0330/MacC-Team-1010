//
//  MakgeolliInformationSignleView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import FeatureInformation

struct MakgeolliInfoSingleView: View {
	let makHoly: MakHolyMini
	
	var body: some View {
		NavigationLink {
			// 막걸리 디테일 뷰로 이동
		} label: {
			VStack(alignment: .leading, spacing: 0) {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(.darkgrey)!))
					.frame(height: 285)
					.overlay {
						VStack {
							Image(uiImage: .designSystem(.mockMakgeolli)!)
								.resizable()
								.aspectRatio(contentMode: .fit)
								.padding(.bottom, 18)
							
							TasteScoreView(type: .mini, sweetness: makHoly.sweetness, sourness: makHoly.sourness, thickness: makHoly.thickness, freshness: makHoly.freshness)
						}
						.padding(.vertical, 32)
					}
				Text(makHoly.name)
					.lineLimit(1)
					.font(.style(.SF14R))
					.padding(.top, 12)
				
				Text(String.formattedSet(adv: makHoly.adv, volume: makHoly.volume, price: makHoly.price))
					.font(.style(.SF12R))
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
					.padding(.top, 2)
			}
		}
	}
}
