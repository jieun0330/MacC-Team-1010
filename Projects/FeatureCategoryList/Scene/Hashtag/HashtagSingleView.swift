//
//  HashtagSingleView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct HashtagSingleView: View {
	@Binding var selected: CharacteristicsType
	
	let title: CharacteristicsType
	
    var body: some View {
		Button {
			selected = title
		} label: {
			Text(title.description)
				.font(.system(size: 15))
				.foregroundColor(.white)
		}
		.cornerRadius(40)
		.buttonStyle(.borderedProminent)
		.tint(selected == title ? .yellow : Color(uiColor: .designSystem(.tempLightGrayColor)!))
    }
}
