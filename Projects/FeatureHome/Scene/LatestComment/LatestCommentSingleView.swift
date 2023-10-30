//
//  LatestCommentSingleView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct LatestCommentSingleView: View {
    var body: some View {
		HStack(spacing: 0) {
			RoundedRectangle(cornerRadius: 12)
				.fill(Color(uiColor: .designSystem(.darkgrey)!))
				.frame(width: 60, height: 80)
				.padding(.trailing, 16)
			
			VStack(alignment: .leading, spacing: 0) {
				Text("좋았어요")
					.font(.system(size: 12))
					.foregroundColor(Color(uiColor: .designSystem(.primary)!))
					.padding(.bottom, 3)
				Text("하늘담 막걸리")
					.font(.system(size: 14))
					.padding(.bottom, 1.5)
				Text("너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요. 너무 맛있어요.")
					.font(.system(size: 14))
					.lineLimit(2)
			}
		}
    }
}
