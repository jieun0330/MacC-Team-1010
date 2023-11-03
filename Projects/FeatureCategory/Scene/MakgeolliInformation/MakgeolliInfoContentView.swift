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
	let makHoly: MakHolyMini

	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text(makHoly.name)
				.font(.system(size: 20, weight: .bold))
				.foregroundColor(.white)

			Spacer()
				.frame(height: 20)

			HStack(spacing: 10) {
				Text("도수")
					.font(.system(size: 16, weight: .regular))
				Text("\(String(format: "%.1f", makHoly.adv))%")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(.white)
			}
			.padding(.bottom, 2)
			HStack(spacing: 10) {
				Text("용량")
					.font(.system(size: 16, weight: .regular))
				Text("\(makHoly.volume)ml")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(.white)
			}
			.padding(.bottom, 2)
			HStack(spacing: 10) {
				Text("가격")
					.font(.system(size: 16, weight: .regular))
				Text("\(makHoly.price)원")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(.white)
			}
		}
	}
}
