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

public struct HomeView: View {
	@StateObject var viewModel = HomeViewModel(
		makgeolliRepository: DefaultMakgeolliRepository(),
		homeRepository: DefaultHomeRepository()
	)
	
	@State var viewOpacityValue = 0.0
	
	public init() {}
	
	public var body: some View {
		if viewModel.fetchLoading {
			ProgressView()
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
				.tint(Color(uiColor: .designSystem(.white)!))
				.onAppear {
					viewModel.fetchNewMakList()
					viewModel.fetchRecentComments()
				}
				.alert(isPresented: $viewModel.errorState) {
					Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
						  dismissButton: .default(Text("확인")))
				}
		} else {
			NavigationStack {
				ScrollView(showsIndicators: false) {
					VStack {
						NavigationLink {
							CategoryView(type: .event, targetTitle: [.none])
						} label: {
							Image(uiImage: .designSystem(.banner)!)
								.resizable()
								.aspectRatio(contentMode: .fit)
								.padding(.bottom, 30)
						}
						
						CharacteristicsView()
						
						Spacer()
							.frame(height: 40)
						
						NewItemView(viewModel: viewModel)
						
						Spacer()
							.frame(height: 40)
						
						LatestCommentView(viewModel: viewModel)
						
						Spacer()
							.frame(height: 20)
					}
				}
				.ignoresSafeArea(.all, edges: .top)
				.opacity(viewOpacityValue)
				.onAppear {
					withAnimation {
						self.viewOpacityValue = 1.0
					}
				}
				.background(Color(uiColor: .designSystem(.darkbase)!))
			}
		}
	}
}
