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
	let comment: Comment
	
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
					HStack(spacing: 0) {
						Text(comment.makHolyId)
							.font(.style(.SF14R))
							.foregroundColor(Color(uiColor: .designSystem(.white)!))
						Image(uiImage: .designSystem(.like)!)
							.padding(.leading, 4)
						Spacer()
						Text(comment.userId)
							.font(.style(.SF14R))
							.foregroundColor(Color(uiColor: .designSystem(.w25)!))
					}
					.padding(.bottom, 3)
					Text(comment.description)
						.lineLimit(2)
						.font(.style(.SF14R))
						.foregroundColor(Color(uiColor: .designSystem(.w85)!))
					Spacer()
					Text(comment.date)
						.font(.style(.SF14R))
						.foregroundColor(Color(uiColor: .designSystem(.w25)!))
				}
				Spacer()
			}
		}
	}
}
