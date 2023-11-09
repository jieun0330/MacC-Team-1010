//
//  InfoIngredientsView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 2023/11/01.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct InfoIngredientsView: View {
	let ingredients: String
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			HStack {
				Text("원재료")
					.SF20B()
					.foregroundColor(.White)
				Spacer()
			}
			.padding(.vertical, 20)
			
			Text(ingredients)
				.SF14R()
				.foregroundColor(.W85)
				.multilineTextAlignment(.leading)
				.lineLimit(nil)
				.fixedSize(horizontal: false, vertical: true)
				.padding(.bottom, 20)
		}
		.padding(.horizontal, 16)
	}
}
