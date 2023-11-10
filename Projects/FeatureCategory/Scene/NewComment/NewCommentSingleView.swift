//
//  NewCommentSingleView.swift
//  FeatureCategory
//
//  Created by Kim SungHun on 2023/11/04.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct NewCommentSingleView: View {
	let comment: RecentComment
	
    var body: some View {
		HStack(alignment: .top, spacing: 0) {
			RoundedRectangle(cornerRadius: 12)
				.fill(Color(uiColor: .designSystem(.darkgrey)!))
				.frame(width: 60, height: 80)
				.padding(.trailing, 16)
				.overlay {
					MakHolyImageView(imageId: comment.makImageNumber ?? "-1", type: .mini)
				}
			
			VStack(alignment: .leading, spacing: 0) {
				HStack(spacing: 0) {
					Text(comment.makName ?? "")
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
					.font(.style(.SF14R))
					.foregroundColor(Color(uiColor: .designSystem(.w85)!))
				Spacer()
				Text(comment.commentInfo?.writeDate ?? "")
					.font(.style(.SF14R))
					.foregroundColor(Color(uiColor: .designSystem(.w25)!))
			}
			Spacer()
		}
    }
}
