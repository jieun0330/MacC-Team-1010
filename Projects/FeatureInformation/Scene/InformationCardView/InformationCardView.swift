//
//  InformationCardView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/8/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct InformationCardView: View {
	@ObservedObject var viewModel: InformationViewModel
	
	var body: some View {
		VStack(spacing: 0) {
			InfoImageView(imageId: viewModel.makHoly.imageId)
				.padding(.bottom, 32)
			
			InfoNameView(name: viewModel.makHoly.name,
						 description: String.formattedSet(makHoly: viewModel.makHoly))
			.padding(.bottom, 15)
			
			TasteScoreView(type: .large, makHoly: viewModel.makHoly)
				.padding(.bottom, 33)
			
			InfoLikeView(viewModel: viewModel)
				.padding(.bottom, 15)
			
			InfoMyCommentView(viewModel: viewModel)
				.padding(.bottom, 33)
			
			if !viewModel.makHoly.awards.isEmpty {
				InfoAwardsView(awards: viewModel.makHoly.awards)
			}
			
		}
	}
}
