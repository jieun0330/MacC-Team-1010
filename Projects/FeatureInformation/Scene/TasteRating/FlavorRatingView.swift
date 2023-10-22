//
//  FlavorRatingView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/21.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct FlavorRatingView: View {
	let flavorName: String
	let tasteRating: Int
	//    @Binding var tasteRating: TasteRating
	
	public var body: some View {
		VStack {
			Text(flavorName)
				.bold()
				.font(.system(size: 12))
				.foregroundColor(.white)
			Circle()
				.frame(width: 60, height: 60)
				.foregroundColor(Color(uiColor: .designSystem(.tasteCircle)!).opacity(
					tasteRating == 1 ? 0.2
					: tasteRating == 2 ? 0.4
					: tasteRating == 3 ? 0.6
					: tasteRating == 4 ? 0.8
					: 1.0
				))
				.overlay(
					Text("\(tasteRating)")
						.bold()
						.foregroundColor(.white)
						.font(.system(size: 30))
				)
		}
	}
}

//case .taste4: return Color(uiColor: .designSystem(.tasteCircle)!).opacity(0.8)
//case .taste3: return Color(uiColor: .designSystem(.tasteCircle)!).opacity(0.6)
//case .taste2: return Color(uiColor: .designSystem(.tasteCircle)!).opacity(0.4)
//case .taste1: return Color(uiColor: .designSystem(.tasteCircle)!).opacity(0.2)

//struct FlavorRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlavorRatingView()
//    }
//}
