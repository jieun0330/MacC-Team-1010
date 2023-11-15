//
//  InfoNameView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/8/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct InfoNameView: View {
	let name: String
	let description: String
	var body: some View {
		VStack(spacing: 4) {
			Text(name)
				.SF24B()
				.foregroundColor(.White)
			Text(description)
				.SF15R()
				.foregroundColor(.W50)
		}
	}
}
