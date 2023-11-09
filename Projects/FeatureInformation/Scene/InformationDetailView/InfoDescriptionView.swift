//
//  InfoDescriptionView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/6/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct InfoDescriptionView: View {
	let description: String
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			
			HStack {
				Text("소개")
					.font(.style(.SF20B))
					.foregroundColor(Color(uiColor: .designSystem(.white)!))
				Spacer()
			}
			.padding(.vertical, 20)
			
			Text(description)
				.font(.style(.SF14R))
				.foregroundColor(Color(uiColor: .designSystem(.w85)!))
				.multilineTextAlignment(.leading)
				.lineLimit(nil)
				.fixedSize(horizontal: false, vertical: true)
				.padding(.bottom, 20)
			
		}
		.padding(.horizontal, 16)
	}
}

