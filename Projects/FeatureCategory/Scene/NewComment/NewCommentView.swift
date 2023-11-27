//
//  NewCommentView.swift
//  FeatureCategory
//
//  Created by Kim SungHun on 2023/11/04.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import FeatureInformation

// 코멘트가 달렸어요 상세 화면
struct NewCommentView: View {
	@ObservedObject var viewModel: CategoryViewModel
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(spacing: 0) {
				Spacer()
					.frame(height: 16)
				ForEach(viewModel.comments, id: \.id) { comment in
					Button {
						if let id = comment.makNumber {
							self.viewModel.resultMakHolyId = id
						}
					} label: {
						VStack(spacing: 0) {
							NewCommentSingleView(comment: comment)
							if comment.id != viewModel.comments.last?.id {
								DividerView()
									.padding(.vertical, 10)
							}
						}
						.padding(.horizontal, 16)
					}
				}
			}
			.padding(.bottom, 16)
			.fullScreenCover(item: $viewModel.resultMakHolyId) { makHolyId in
				InformationView(makHolyId: makHolyId,
								mpParamters: MPInfoClosedEventParameters(id: makHolyId,
																		 previousView: .newCommentView))
			}
		}
	}
}
