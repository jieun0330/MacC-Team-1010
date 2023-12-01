//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/06.
//

import SwiftUI
import Core
import DesignSystem
import FeatureCategory
import FeatureInformation
import Utils

public struct HomeView: View {
	@StateObject var viewModel = HomeViewModel(
		makgeolliRepository: DefaultMakgeolliRepository(),
		homeRepository: DefaultHomeRepository()
	)
	
	public init() {}
	
	public var body: some View {
		if viewModel.makListLoading {
			ProgressView()
				.modifier(ProgressViewBackground())
				.onAppear {
					viewModel.fetchNewMakList()
				}
				.alert(isPresented: $viewModel.errorState) {
					Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
						  dismissButton: .default(Text("확인")))
				}
		} else {
			NavigationStack {
				ScrollView(showsIndicators: false) {
					VStack {
						HStack {
							Text("모아보기")
								.font(.system(size: 28, weight: .bold))
							Spacer()
							
							Image(uiImage: UIImage(named: KeyChainManager.shared.read(account: .profileImage),
												   in: DesignSystem.Constant.bundle, with: nil) ?? .designSystem(.profileIcon1)!)
							.resizable()
							.frame(width: 30, height: 30)
						}
						.padding(.vertical, 20)
						.padding(.horizontal, 16)
						
						CharacteristicsView()
						
						Spacer()
							.frame(height: 40)
						
						NewItemView(viewModel: viewModel)
							.fullScreenCover(item: $viewModel.resultMakHolyId) { makHolyId in
								InformationView(makHolyId: makHolyId,
												mpParamters: MPInfoClosedEventParameters(id: makHolyId,
																						 previousView: .homeNewItemCell))
							}
						
						Spacer()
							.frame(height: 40)
						
						LatestCommentView(viewModel: viewModel)
							.fullScreenCover(item: $viewModel.resultLatestestCommentMakHolyId) { makHolyId in
							InformationView(makHolyId: makHolyId,
								mpParamters: MPInfoClosedEventParameters(id: makHolyId,
																		 previousView: .homeNewCommentCell))
			}
						
						Spacer()
							.frame(height: 20)
					}
				}
				.background(Color(uiColor: .designSystem(.darkbase)!))
			}
			.onAppear {
				viewModel.fetchRecentComments()
			}
		}
	}
}
