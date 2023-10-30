//
//  MakgeolliInformationContentView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/21.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct MakgeolliInfoContentView: View {
	let makgeolliData: MockMakgeolliModel

	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text(makgeolliData.breweryName)
				.font(.system(size: 16, weight: .bold))
				.padding(.bottom, 2)
			Text(makgeolliData.name)
				.font(.system(size: 20, weight: .bold))
				.foregroundColor(.white)

			Spacer()
				.frame(height: 20)

			HStack(spacing: 10) {
				Text("도수")
					.font(.system(size: 16, weight: .regular))
				Text("\(String(format: "%.1f", makgeolliData.alcoholContent))%")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(.white)
			}
			.padding(.bottom, 2)
			HStack(spacing: 10) {
				Text("용량")
					.font(.system(size: 16, weight: .regular))
				Text("\(makgeolliData.capacity)ml")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(.white)
			}
			.padding(.bottom, 2)
			HStack(spacing: 10) {
				Text("가격")
					.font(.system(size: 16, weight: .regular))
				Text("\(makgeolliData.price)원")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(.white)
			}
		}
	}
}
