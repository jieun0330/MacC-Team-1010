//
//  ContentView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

public struct InformationView: View {
	
	@StateObject var viewModel: InformationViewModel
	
	public init(makHolyId: Int) {
		self._viewModel = StateObject(wrappedValue: InformationViewModel(makHolyId: makHolyId, maHolyRepo: DefaultMakgeolliRepository(), userRepo: DefaultUserRepository()))
	}
	
	public var body: some View {
		
		ScrollView(.vertical, showsIndicators: false) {
			VStack(spacing: 0) {
				ZStack {
					LinearGradient(
						stops: [
							Gradient.Stop(color: .NightSky2Top, location: 0.00),
							Gradient.Stop(color: .NightSky2Bottom, location: 1.00),
						],
						startPoint: UnitPoint(x: 0.45, y: 0),
						endPoint: UnitPoint(x: 0.45, y: 1)
					)
					.ignoresSafeArea(.all, edges: .top)
					
					InformationCardView(viewModel: viewModel)
				}
				InformationDetailView(viewModel: viewModel)
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.toolbar{
			ToolbarItem(placement: .topBarLeading) {
				InfoBackButton()
			}
			ToolbarItem(placement: .topBarTrailing) {
				InfoBookMarkButton(viewModel: viewModel)
			}
		}
		.onAppear(perform: {
			viewModel.fetchDatas()
		})
		.actionSheet(isPresented: $viewModel.showActionSheet, content: {
			ActionSheet(title: Text("Action Sheet title"))
		})
		.sheet(isPresented: $viewModel.showDetailCommentListSheet, content: {
			InfoLikeCommentDetailView(isPresented: $viewModel.showDetailCommentListSheet, comments: viewModel.comments, makHolyName: viewModel.makHoly.name)
		})
	}
}


