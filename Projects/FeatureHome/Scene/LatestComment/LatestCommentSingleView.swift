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
	let review: ReviewResponse
	
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
					switch review.preference {
					case 0:
						Text("평가가 없어요")
							.font(.style(.SF12R))
							.foregroundColor(Color(uiColor: .designSystem(.w60)!))
							.padding(.bottom, 3)
					case 1:
						Text("아쉬워요")
							.font(.style(.SF12R))
							.foregroundColor(Color(uiColor: .designSystem(.w60)!))
							.padding(.bottom, 3)
					case 2:
						Text("좋았어요")
							.font(.style(.SF12R))
							.foregroundColor(Color(uiColor: .designSystem(.primary)!))
							.padding(.bottom, 3)
					default:
						EmptyView()
					}
					Text(review.makName)
						.font(.style(.SF14R))
						.padding(.bottom, 1.5)
					Text(review.content)
						.font(.style(.SF14R))
						.lineLimit(2)
				}
			}
		}
	}
}
