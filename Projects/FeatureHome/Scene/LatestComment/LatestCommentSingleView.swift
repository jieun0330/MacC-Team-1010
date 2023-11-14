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
	let comment: RecentComment
	
	var body: some View {
		NavigationLink {
			// 막걸리 상세 뷰로 이동
		} label: {
			HStack(spacing: 0) {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(.darkgrey)!))
					.frame(width: 60, height: 80)
					.overlay {
						MakHolyImageView(imageId: comment.makImageNumber ?? "-1", type: .mini)
					}
					.padding(.trailing, 16)
				
				VStack(alignment: .leading, spacing: 0) {
					HStack(spacing: 0) {
						Text(comment.makName ?? "")
							.lineLimit(1)
							.font(.style(.SF14R))
							.foregroundColor(Color(uiColor: .designSystem(.white)!))
						Image(uiImage: .designSystem(.like)!)
							.padding(.leading, 4)
						Spacer()
						Text(comment.commentInfo?.userNickName ?? "")
							.font(.style(.SF14R))
							.foregroundColor(Color(uiColor: .designSystem(.w25)!))
					}
					.padding(.bottom, 3)
					Text(comment.commentInfo?.contents ?? "")
						.multilineTextAlignment(.leading)
						.lineLimit(2)
						.font(.style(.SF14R))
						.foregroundColor(Color(uiColor: .designSystem(.w85)!))
					Spacer()
					Text(comment.commentInfo?.writeDate?.extractDateFromISOString() ?? "")
						.font(.style(.SF14R))
						.foregroundColor(Color(uiColor: .designSystem(.w25)!))
				}
				Spacer()
			}
		}
	}
}
