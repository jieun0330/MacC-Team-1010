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
		homeRepository: DefaultHomeRepository(),
		topicRepository: DefaultTopicRepository()
	)
	
	@State var targetTitle: [CharacteristicsType]
	
	let type: CategoryType
	
	public init(type: CategoryType, targetTitle: [CharacteristicsType]) {
		self.type = type
		self.targetTitle = targetTitle
	}
	
	public var body: some View {
		if type == .comment {
			if viewModel.fetchCommentLoading {
				ProgressView()
					.modifier(ProgressViewBackground())
					.modifier(NavigationBarBackground(type.description))
					.onAppear {
						if viewModel.fetchCommentLoading {
							viewModel.fetchRecentComments()
						}
					}
					.alert(isPresented: $viewModel.errorState) {
						Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
							  dismissButton: .default(Text("확인")))
					}
			} else {
				NewCommentView(viewModel: viewModel)
					.modifier(NavigationBarBackground(type.description))
			}
		} else {
			VStack(spacing: 0) {
				if type == .characteristics {
					HashtagView(viewModel: viewModel,
								targetTitle: $targetTitle)
					.padding(.bottom, 10)
				}
				
				switch type {
				case .pohang, .koreaAward2023, .new:
					MakgeolliInfoView(viewModel: viewModel,
									  type: type,
									  mpTerm: "상단 배너-주류 대상",
									  targetTitle: targetTitle)
						.padding(.horizontal, 8)
				default:
					if viewModel.fetchLoading {
						ProgressView()
							.modifier(ProgressViewBackground())
							.alert(isPresented: $viewModel.errorState) {
								Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
									  dismissButton: .default(Text("확인")))
							}
					} else {
						MakgeolliInfoView(viewModel: viewModel, 
										  type: type,
										  mpTerm: "[\(targetTitle.map({ $0.description }).joined(separator: ", "))]",
										  targetTitle: targetTitle)
							.padding(.horizontal, 8)
					}
				}
			}
			.modifier(NavigationBarBackground(type.description))
			.onAppear {
				if type == .pohang {
					viewModel.initFetchPohangMakgeolli()
				} else if type == .koreaAward2023 {
					viewModel.initFetch2023KoreaAward()
				} else if type == .new {
					viewModel.initNewCategoryMakgeolli()
				} else if viewModel.fetchLoading {
					viewModel.initFetchCategoryMakgeolli(sort: nil, offset: nil, categories: targetTitle)
				}
			}
		}
	}
}
