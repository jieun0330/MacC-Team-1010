//
//  InfoBookMarkButton.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/10/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct InfoBookMarkButton: View {
	@ObservedObject var viewModel: InformationViewModel
    var body: some View {
		Button(action: {
			viewModel.toggleBookMark()
		}, label: {
			Image(systemName: viewModel.myReaction.isBookMarked ? "heart.fill" : "heart")
				.font(.system(size: 24, weight: .bold))
				.foregroundColor(viewModel.myReaction.isBookMarked ? .Alert : .W25)
		})
    }
}
