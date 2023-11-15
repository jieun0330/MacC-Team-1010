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
	@Binding var isModelPresented: Bool
	
	public var body: some View {
		Button(action: {
			self.isModelPresented = false
		}) {
			
			Image(systemName: "xmark")
				.font(.system(size: 17, weight: .bold))
				.foregroundColor(.W85)
				.padding(6)
				.background(
					.ultraThinMaterial,
					in: Circle())
			
		}
	}
}
