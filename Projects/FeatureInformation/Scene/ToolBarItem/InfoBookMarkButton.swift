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
			viewModel.myReaction.isBookMarked.toggle()
		}, label: {
			Image(uiImage: viewModel.myReaction.isBookMarked ? .designSystem(.bookMarkedTrue)! : .designSystem(.bookMarkedFalse)!)
		})
    }
}
