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
	@State var buttonState: Bool? = true
	
	var body: some View {
		HStack(spacing: 16) {
			DisLikeButton(buttonState: $buttonState)
			LikeButton(buttonState: $buttonState)
		}
	}
}


extension LikeControllerView {
	
	struct LikeButton: View {
		@Binding var buttonState: Bool?
		var body: some View {
			Button(action: {
				buttonState = (buttonState == true) ? nil : true
			}, label: {
				ZStack{
					RoundedRectangle(cornerRadius: 12)
						.frame(height: 50)
						.foregroundColor(buttonState == true ? Color(uiColor: .designSystem(.goldenyellow)!) : Color(uiColor: .designSystem(.w10)!))
					
					HStack(spacing: 3) {
						Image(systemName: "hand.thumbsup.fill")
						Text("좋았어요")
					}
					.font(.style(.SF17R))
					.foregroundColor(buttonState == true ? Color(uiColor: .designSystem(.white)!) : Color(uiColor: .designSystem(.darkgrey)!))
				}
			})
		}
	}
	
	struct DisLikeButton: View {
		@Binding var buttonState: Bool?
		var body: some View {
			Button(action: {
				buttonState = (buttonState == false) ? nil : false
			}, label: {
				ZStack{
					RoundedRectangle(cornerRadius: 12)
						.frame(height: 50)
						.foregroundColor(buttonState == false ? Color(uiColor: .designSystem(.lilac)!) : Color(uiColor: .designSystem(.w10)!))
					
					HStack(spacing: 3) {
						Image(systemName: "hand.thumbsdown.fill")
						Text("아쉬워요")
					}
					.font(.style(.SF17R))
					.foregroundColor(buttonState == false ? Color(uiColor: .designSystem(.white)!) : Color(uiColor: .designSystem(.darkgrey)!))
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
