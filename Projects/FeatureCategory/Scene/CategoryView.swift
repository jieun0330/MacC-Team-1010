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
	@State var targetTitle: [String]
	
	public init(type: CategoryType, targetTitle: [String]) {
		self.type = type
		self.targetTitle = targetTitle
	}
	
	public var body: some View {
		VStack(spacing: 0) {
			HashtagView(type: self.type,
						viewModel: viewModel,
						targetTitle: $targetTitle)
			.padding(.leading, 16)
			.padding(.bottom, 10)
			
			DividerView(topPadding: 10, bottomPadding: 16)
			
			HStack {
				Text("어떤 방식으로 목록이 나오나요?")
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
					.font(.style(.SF12R))
				Spacer()
				Text("추천순")
					.foregroundColor(Color(uiColor: .designSystem(.primary)!))
					.font(.style(.SF12R))
			}
			.padding(.horizontal, 16)
			.padding(.bottom, 16)
			
			if viewModel.fetchLoading {
				ProgressView()
					.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
					.tint(.white)
			} else {
				MakgeolliInfoView()
					.padding(.horizontal, 8)
			}
		}
		.navigationTitle("특징으로 찾기")
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
