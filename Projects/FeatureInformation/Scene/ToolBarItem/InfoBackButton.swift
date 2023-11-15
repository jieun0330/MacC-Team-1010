//
//  InfoBackButton.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/10/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct InfoBackButton: View {
	@Environment(\.presentationMode) var presentationMode
	
	public var body: some View {
		Button(action: {
			self.presentationMode.wrappedValue.dismiss()
		}) {
			
			Image(systemName: "xmark")
				.font(.system(size: 17, weight: .bold))
				.foregroundColor(.W85)
				.padding(7)
				.background(
					.ultraThinMaterial,
					in: Circle())
			
		}
	}
}
