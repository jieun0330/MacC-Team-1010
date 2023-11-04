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
	let comment: Comment
	
    var body: some View {
		HStack(alignment: .top, spacing: 0) {
			RoundedRectangle(cornerRadius: 12)
				.fill(Color(uiColor: .designSystem(.darkgrey)!))
				.frame(width: 60, height: 80)
				.padding(.trailing, 16)
			
			VStack(alignment: .leading, spacing: 0) {
				HStack(spacing: 0) {
					Text(comment.makHolyId)
						.font(.style(.SF14R))
						.foregroundColor(.white)
					Image(uiImage: .designSystem(.like)!)
						.padding(.leading, 4)
					Spacer()
					Text(comment.userId)
						.font(.style(.SF14R))
						.foregroundColor(Color(uiColor: .designSystem(.w25)!))
				}
				.padding(.bottom, 3)
				Text(comment.description)
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
