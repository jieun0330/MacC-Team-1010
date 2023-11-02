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
	let makgeolliData: MakgeolliItem
	
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
							
							TasteScoreView(type: .mini, taste: Taste(sweetness: .one, sourness: .two, thickness: .three, freshness: .four))
						}
						.padding(.vertical, 32)
					}
				Text(makgeolliData.makName!)
					.lineLimit(1)
					.font(.style(.SF14R))
					.padding(.top, 12)
				
				Text("\(String(format: "%.1f", makgeolliData.makAlcoholPercentage!))도, \(makgeolliData.makVolume!)ml, \(makgeolliData.makPrice!)원")
					.font(.style(.SF12R))
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
					.padding(.top, 2)
			}
		}
	}
}
