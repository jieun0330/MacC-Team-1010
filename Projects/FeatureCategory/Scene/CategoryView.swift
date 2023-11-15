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
		makgeolliRepository: DefaultMakgeolliRepository(),
		homeRepository: DefaultHomeRepository()
	)
	
	@State var targetTitle: [CharacteristicsType]
	
	let type: CategoryType
	
	public init(type: CategoryType, targetTitle: [CharacteristicsType]) {
		self.type = type
		self.targetTitle = targetTitle
	}
	
	public var body: some View {
		if type == .comment {
			NewCommentView(comments: viewModel.comments)
				.background(Color(uiColor: .designSystem(.darkbase)!))
				.navigationTitle(type.description)
				.navigationBarTitleDisplayMode(.inline)
				.navigationBarBackButtonHidden(true)
				.navigationBarItems(leading: CustomBackButton())
				.toolbarBackground(Color(uiColor: .designSystem(.darkbase)!), for: .navigationBar)
				.onAppear {
					if viewModel.fetchCommentLoading {
						viewModel.fetchRecentComments()
					}
				}
		} else {
			VStack(spacing: 0) {
				if type == .characteristics {
					HashtagView(viewModel: viewModel,
								targetTitle: $targetTitle)
					.padding(.bottom, 10)
				}
				
				switch type {
				case .event:
					MakgeolliInfoView(viewModel: viewModel, type: type, targetTitle: targetTitle)
						.padding(.horizontal, 8)
				default:
					if viewModel.fetchLoading {
						ProgressView()
							.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
							.foregroundColor(Color(uiColor: .designSystem(.white)!))
					} else {
						MakgeolliInfoView(viewModel: viewModel, type: type, targetTitle: targetTitle)
							.padding(.horizontal, 8)
					}
				}
			}
			.background(Color(uiColor: .designSystem(.darkbase)!))
			.navigationTitle(type.description)
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: CustomBackButton())
			.toolbarBackground(Color(uiColor: .designSystem(.darkbase)!), for: .navigationBar)
			.onAppear {
				if viewModel.fetchLoading && type != .event {
					viewModel.initFetchCategoryMakgeolli(sort: nil, offset: nil, categories: targetTitle)
				}
			}
		}
	}
}
