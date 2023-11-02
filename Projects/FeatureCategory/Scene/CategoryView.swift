//
//  CategoryListView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/20.
//

import SwiftUI
import Core
import DesignSystem
import FeatureInformation

public struct CategoryView: View {
	@StateObject private var viewModel = CategoryViewModel(
		makgeolliRepository: DefaultMakgeolliRepository()
	)
	
	@State var targetTitle: [CharacteristicsType]
	
	let type: CategoryType
	
	public init(type: CategoryType, targetTitle: [CharacteristicsType]) {
		self.type = type
		self.targetTitle = targetTitle
	}
	
	public var body: some View {
		VStack(spacing: 0) {
			if type == .characteristics {
				HashtagView(viewModel: viewModel,
							targetTitle: $targetTitle)
				.padding(.leading, 16)
				.padding(.bottom, 10)
			}
			
			DividerView(topPadding: 10, bottomPadding: 16)
			
			if viewModel.fetchLoading {
				ProgressView()
					.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
					.tint(.white)
			} else {
				MakgeolliInfoView(viewModel: viewModel, type: type)
					.padding(.horizontal, 8)
			}
		}
		.navigationTitle(type.description)
		.navigationBarTitleDisplayMode(type == .characteristics ? .inline : .large)
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: CustomBackButton())
		.onAppear {
			if viewModel.fetchLoading {
				viewModel.fetchCategoryMakgeolli(categories: targetTitle)
			}
		}
	}
}
