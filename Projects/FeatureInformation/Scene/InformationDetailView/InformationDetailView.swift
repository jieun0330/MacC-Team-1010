//
//  InformationDetailView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/8/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

struct InformationDetailView: View {
	@ObservedObject var viewModel: InformationViewModel
	var body: some View {
		VStack(spacing: 20) {
			
			InfoDescriptionView(description: viewModel.makHoly.description)
				.padding(.top, 10)
			
			InfoLikeCommentView(viewModel: viewModel)
			
			InfoIngredientsView(ingredients: viewModel.makHoly.ingredients)
			
			InfoLinkView(brewery: viewModel.makHoly.brewery)
			
		}
	}
}
