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
	let makgeolliData: MockMakgeolliModel
	
	var body: some View {
		NavigationLink {
			InformationView()
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
				Text("하늘달 막걸리")
					.font(.style(.SF14R))
					.padding(.top, 12)
				Text("9도, 650ml, 5000원")
					.font(.style(.SF12R))
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
					.padding(.top, 2)
			}
		}
	}
}
