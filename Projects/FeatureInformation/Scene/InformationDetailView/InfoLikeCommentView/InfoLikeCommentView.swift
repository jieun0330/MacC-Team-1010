//
//  InfoLikeCommentView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/8/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct InfoLikeCommentView: View {
	@ObservedObject var viewModel: InformationViewModel
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			
			HStack(alignment: .center, spacing: 3) {
				Text("평가 및 코멘트")
					.SF20B()
					.foregroundColor(.White)
				if viewModel.comments.count > 1 {
					Image(systemName: "chevron.right")
						.font(.system(size: 20, weight: .bold))
						.foregroundColor(.White)
				}
				Spacer()
			}
			.padding(.vertical, 20)
			.padding(.horizontal, 16)
			.onTapGesture {
				if viewModel.comments.count > 1 {
					viewModel.showDetailCommentListSheet = true
				}
			}
			.sheet(isPresented: $viewModel.showDetailCommentListSheet, content: {
				InfoLikeCommentDetailView(isPresented: $viewModel.showDetailCommentListSheet, comments: viewModel.comments, makHolyName: viewModel.makHoly.name)
			})
			
			InfoLikePercentageView(likeDetail: viewModel.likeDetail)
				.padding(.bottom, 20)
			
			InfoCommentsListView(viewModel: viewModel)
				.padding(.bottom, 20)
			
		}
	}
}

