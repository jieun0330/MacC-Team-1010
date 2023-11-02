//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/06.
//

import SwiftUI
import Core
import DesignSystem

public struct HomeView: View {
	@StateObject var viewModel = HomeViewModel(
		makgeolliRepository: DefaultMakgeolliRepository(),
		reviewRepository: DefaultReviewRepository(),
		userRepository: DefaultUserRepository()
	)
	
	@State var viewOpacityValue = 0.0
	
	public init() {}
	
	public var body: some View {
		if viewModel.fetchLoading {
			ProgressView()
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
				.tint(Color(uiColor: .designSystem(.white)!))
				.onAppear {
					viewModel.fetchNewMakgeolli()
					viewModel.fetchReview()
				}
		} else {
			NavigationStack {
				ScrollView(showsIndicators: false) {
					VStack {
						GeometryReader { proxy in
							let global = proxy.frame(in: .global)
							LinearGradient(
								stops: [
									Gradient.Stop(color: Color(red: 0.18, green: 0.18, blue: 0.39),
												  location: 0.00),
									Gradient.Stop(color: Color(red: 0.4, green: 0.33, blue: 0.13),
												  location: 1.00),
								],
								startPoint: UnitPoint(x: 0.5, y: 0),
								endPoint: UnitPoint(x: 0.5, y: 1)
							)
							// image로 변경 시 resizable 추가해야함
							.offset(y: global.minY > 0 ? -global.minY : 0)
							.frame(
								height: global.minY > 0 ?
								(UIScreen.main.bounds.height/2.5) + global.minY
								: UIScreen.main.bounds.height/2.5
							)
						}
						.frame(height: UIScreen.main.bounds.height / 2.5)
						.padding(.bottom, 20)
						
						CharacteristicsView()
						
						DividerView(topPadding: 10, bottomPadding: 20)
						
						NewItemView(viewModel: viewModel)
						
						DividerView(topPadding: 10, bottomPadding: 20)
						
						LatestCommentView(viewModel: viewModel)
					}
				}
				.ignoresSafeArea(.all, edges: .top)
				.opacity(viewOpacityValue)
				.onAppear {
					withAnimation {
						self.viewOpacityValue = 1.0
					}
				}
			}
		}
	}
}
