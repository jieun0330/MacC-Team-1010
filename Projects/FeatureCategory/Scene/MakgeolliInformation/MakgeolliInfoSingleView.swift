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
			InformationView(makgeolliData: makgeolliData)
		} label: {
			RoundedRectangle(cornerRadius: 12)
				.fill(Color(uiColor: .designSystem(.darkgrey)!))
				.frame(height: 285)
		}
	}
}
