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
	let makHoly: MakContent
	
	var body: some View {
		NavigationLink {
			// 막걸리 디테일 뷰로 이동
		} label: {
			VStack(alignment: .leading, spacing: 0) {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(.darkgrey)!))
					.frame(height: 320)
					.overlay {
						VStack(spacing: 0) {
							Image(uiImage: .designSystem(.mockMakgeolli)!)
								.resizable()
								.aspectRatio(contentMode: .fit)
								.padding(.bottom, 16)
							
							Text(makHoly.makName ?? "")
								.lineLimit(1)
								.font(.style(.SF12R))
							
							Text(String.formattedSet(adv: makHoly.makAlcoholPercentage ?? 0.0,
													 volume: makHoly.makVolume ?? 0,
													 price: makHoly.makPrice ?? 0))
							.font(.style(.SF10R))
							.foregroundColor(Color(uiColor: .designSystem(.w50)!))
							.padding(.top, 2)
							
							TasteScoreView(type: .mini,
										   sweetness: Int(makHoly.makTasteSweet ?? -1.0),
										   sourness: Int(makHoly.makTasteSour ?? -1.0),
										   thickness: Int(makHoly.makTasteThick ?? -1.0),
										   freshness: Int(makHoly.makTasteFresh ?? -1.0))
							.padding(.top, 10)
						}
						.padding(.vertical, 32)
					}
			}
		}
	}
}
