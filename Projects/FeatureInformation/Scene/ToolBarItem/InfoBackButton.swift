//
//  InfoBackButton.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/10/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct InfoBackButton: View {
	@ObservedObject var viewModel: InformationViewModel
	@Environment(\.presentationMode) var presentationMode
	
	public var body: some View {
		Button(action: {
			MixpanelManager.shared.informationViewClosed(parameters: viewModel.mpParameters)
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
