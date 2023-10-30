//
//  LatestCommentView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct LatestCommentView: View {
    var body: some View {
		VStack {
			HStack(spacing: 4) {
				Text("코멘트가 달렸어요")
					.font(.system(size: 22, weight: .bold))
					.foregroundColor(.white)
				Image(systemName: "chevron.right")
					.font(.system(size: 22, weight: .bold))
				Spacer()
			}
			VStack(spacing: 16) {
				LatestCommentSingleView()
				LatestCommentSingleView()
				LatestCommentSingleView()
				LatestCommentSingleView()
			}
		}
		.padding(.horizontal, 16)
    }
}
