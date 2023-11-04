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

struct NewCommentView: View {
	let comments: [Comment]
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(spacing: 0) {
				Spacer()
					.frame(height: 16)
				ForEach(comments) { comment in
					VStack(spacing: 0) {
						NewCommentSingleView(comment: comment)
						DividerView()
							.padding(.vertical, 10)
					}
					.padding(.horizontal, 16)
				}
			}
		}
	}
}
