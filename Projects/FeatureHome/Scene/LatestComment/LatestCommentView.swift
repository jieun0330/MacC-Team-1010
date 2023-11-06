//
//  LatestCommentView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import FeatureCategory

struct LatestCommentView: View {
	@ObservedObject var viewModel: HomeViewModel
	
	var body: some View {
		VStack {
			NavigationLink {
				CategoryView(type: .comment, targetTitle: [])
			} label: {
				HStack(spacing: 4) {
					Text("코멘트가 달렸어요")
						.font(.style(.SF20B))
						.foregroundColor(Color(uiColor: .designSystem(.white)!))
					Image(systemName: "chevron.right")
						.font(.system(size: 22, weight: .bold))
						.foregroundColor(Color(uiColor: .designSystem(.white)!))
					Spacer()
				}
			}
			VStack(spacing: 16) {
				ForEach(viewModel.comments, id: \.self) { comment in
					LatestCommentSingleView(comment: comment)
				}
			}
		}
		.padding(.horizontal, 16)
	}
}
