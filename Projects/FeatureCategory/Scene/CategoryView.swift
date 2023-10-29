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
	let type: CategoryType
	
	@StateObject private var viewModel = CategoryViewModel()
	@State var targetTitle: String
	
	public init(type: CategoryType, targetTitle: String) {
		self.type = type
		self.targetTitle = targetTitle
	}
	
	public var body: some View {
		VStack {
			HashtagView(type: self.type,
						viewModel: viewModel,
						targetTitle: $targetTitle)
			.padding(.leading, 16)
			
			Spacer()
				.frame(height: 16)
			
			if viewModel.fetchLoading {
				ProgressView()
					.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
					.tint(.white)
			} else {
				MakgeolliInfoView()
					.padding(.horizontal, 16)
			}
		}
		.background(Color(uiColor: .designSystem(.bgColor)!))
		.navigationTitle(targetTitle)
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: CustomBackButton())
		.onAppear {
			if viewModel.fetchLoading {
				viewModel.fetchCategoryList()
			}
		}
	}
}
