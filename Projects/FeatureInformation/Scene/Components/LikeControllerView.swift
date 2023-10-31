//
//  LikeControllerView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

enum LikeState {
	case none
	case like
	case dislike
}

struct LikeControllerView: View {
	@State var buttonState: LikeState = .none
	
	var body: some View {
		HStack(spacing: 16) {
			DisLikeButton(buttonState: $buttonState)
			LikeButton(buttonState: $buttonState)
		}
	}
}


extension LikeControllerView {
	
	struct LikeButton: View {
		@Binding var buttonState: LikeState
		var body: some View {
			Button(action: {
				buttonState = .like
			}, label: {
				ZStack{
					RoundedRectangle(cornerRadius: 12)
						.frame(width: 150, height: 50)
						.foregroundColor(buttonState == .like ? Color(uiColor: .designSystem(.goldenyellow)!) : Color(uiColor: .designSystem(.w10)!))
					
					HStack(spacing: 5) {
						Image(systemName: "hand.thumbsup.fill")
						Text("좋았어요")
					}
					.font(.style(.SF17R))
					.foregroundColor(buttonState == .like ? Color(uiColor: .designSystem(.white)!) : Color(uiColor: .designSystem(.lightgrey)!))
				}
			})
		}
	}
	
	struct DisLikeButton: View {
		@Binding var buttonState: LikeState
		var body: some View {
			Button(action: {
				buttonState = .dislike
			}, label: {
				ZStack{
					RoundedRectangle(cornerRadius: 12)
						.frame(width: 150, height: 50)
						.foregroundColor(buttonState == .dislike ? Color(uiColor: .designSystem(.goldenyellow)!) : Color(uiColor: .designSystem(.w10)!))
					
					HStack(spacing: 5) {
						Image(systemName: "hand.thumbsdown.fill")
						Text("아쉬워요")
					}
					.font(.style(.SF17R))
					.foregroundColor(buttonState == .dislike ? Color(uiColor: .designSystem(.white)!) : Color(uiColor: .designSystem(.lightgrey)!))
				}
			})
		}
	}
	
}

struct LikeControllerView_Previews: PreviewProvider {
	static var previews: some View {
		LikeControllerView()
	}
}
