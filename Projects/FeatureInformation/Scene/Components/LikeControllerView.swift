//
//  LikeControllerView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct LikeControllerView: View {
	@ObservedObject var viewModel: InformationViewModel
	
	var body: some View {
		HStack(spacing: 16) {
			dislikeButton()
			likeButton()
		}
	}
}


extension LikeControllerView {
	@ViewBuilder
	func likeButton() -> some View {
		Button(action: {
			viewModel.likeButtonTapped()
		}, label: {
			ZStack{
				RoundedRectangle(cornerRadius: 12)
					.frame(height: 50)
					.foregroundColor(viewModel.makHoly.likeState == .like ? Color(uiColor: .designSystem(.goldenyellow)!) : Color(uiColor: .designSystem(.w10)!))
				
				HStack(spacing: 3) {
					Image(systemName: "hand.thumbsup.fill")
					Text("좋았어요")
				}
				.font(.style(.SF17R))
				.foregroundColor(viewModel.makHoly.likeState == .like ? Color(uiColor: .designSystem(.white)!) : Color(uiColor: .designSystem(.w85)!))
			}
		})
		
	}
	
	func dislikeButton() -> some View {
		
		Button(action: {
			viewModel.dislikeButtonTapped()
		}, label: {
			ZStack{
				RoundedRectangle(cornerRadius: 12)
					.frame(height: 50)
					.foregroundColor(viewModel.makHoly.likeState == .dislike ? Color(uiColor: .designSystem(.lilac)!) : Color(uiColor: .designSystem(.w10)!))
				
				HStack(spacing: 3) {
					Image(systemName: "hand.thumbsdown.fill")
					Text("아쉬워요")
				}
				.font(.style(.SF17R))
				.foregroundColor(viewModel.makHoly.likeState == .dislike ? Color(uiColor: .designSystem(.white)!) : Color(uiColor: .designSystem(.darkgrey)!))
			}
		})
	}
}
