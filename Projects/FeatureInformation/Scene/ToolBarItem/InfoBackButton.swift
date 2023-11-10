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
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
	public var body: some View {
		Button(action: {
			self.presentationMode.wrappedValue.dismiss()
		}) {
			HStack(spacing: 3) {
				Image(uiImage: .designSystem(.infoBackButton)!)
			}
		}
	}
}
