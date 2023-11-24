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
		VStack(alignment: .leading, spacing: 20) {
			HStack {
				Text("원재료")
					.SF20B()
					.foregroundColor(.White)
				Spacer()
			}
			
			Text(ingredients)
				.SF14R()
				.foregroundColor(.W85)
				.multilineTextAlignment(.leading)
				.lineLimit(nil)
				.fixedSize(horizontal: false, vertical: true)
			
			Text("정보출처: 식품안전나라")
				.SF12B()
				.foregroundColor(.W25)
				.frame(maxWidth: .infinity, alignment: .leading)
			
		}
		.padding(.horizontal, 16)
		.padding(.vertical, 20)
	}
}
