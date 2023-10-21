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
	let title: String
	
	@Binding var targetTitle: String
	
    var body: some View {
		Button {
			targetTitle = title
		} label: {
			Text(title)
				.font(.system(size: 15))
				.foregroundColor(.white)
		}
		.cornerRadius(40)
		.buttonStyle(.borderedProminent)
		.tint(title == targetTitle ? .yellow : Color(uiColor: .designSystem(.tempLightGrayColor)!))
    }
}
