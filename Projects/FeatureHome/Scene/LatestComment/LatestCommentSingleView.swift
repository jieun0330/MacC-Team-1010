//
//  LatestCommentSingleView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct LatestCommentSingleView: View {
	var body: some View {
		NavigationLink {
			// 막걸리 상세 뷰로 이동
		} label: {
			HStack(spacing: 0) {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(.darkgrey)!))
					.frame(width: 60, height: 80)
					.padding(.trailing, 16)
				
				VStack(alignment: .leading, spacing: 0) {
					Text("평가가 없어요")
						.font(.style(.SF12R))
						.foregroundColor(Color(uiColor: .designSystem(.w50)!))
						.padding(.bottom, 3)
					Text("review.makName")
						.font(.style(.SF14R))
						.padding(.bottom, 1.5)
					Text("review.content")
						.font(.style(.SF14R))
						.lineLimit(2)
				}
			}
		}
	}
}
