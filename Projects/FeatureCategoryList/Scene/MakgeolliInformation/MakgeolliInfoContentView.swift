//
//  MakgeolliInformationContentView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/21.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct MakgeolliInfoContentView: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text("순천주조")
				.font(.system(size: 16, weight: .bold))
				.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
				.padding(.bottom, 2)
			Text("하늘달6 생막걸리")
				.font(.system(size: 20, weight: .bold))
				.foregroundColor(.white)
			
			Spacer()
				.frame(height: 20)
			
			HStack(spacing: 10) {
				Text("도수")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
				Text("9%")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(.white)
			}
			.padding(.bottom, 2)
			HStack(spacing: 10) {
				Text("도수")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
				Text("9%")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(.white)
			}
			.padding(.bottom, 2)
			HStack(spacing: 10) {
				Text("도수")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(Color(uiColor: .designSystem(.tempLightGrayColor)!))
				Text("9%")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(.white)
			}
		}
	}
}

struct MakgeolliInformationContentView_Previews: PreviewProvider {
	static var previews: some View {
		MakgeolliInfoContentView()
	}
}
