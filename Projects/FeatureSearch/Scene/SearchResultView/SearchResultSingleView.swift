//
//  SearchResultSingleView.swift
//  FeatureSearch
//
//  Created by Eric Lee on 2023/10/22.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct SearchResultSingleView: View {
	let makHoly: SearchResult
	
	var body: some View {
		HStack(alignment: .center, spacing: 0) {
			
			imageView()
			
			Spacer()
				.frame(width: 16)
			
			HStack(alignment: .bottom) {
				descriptionView()
				
				Spacer()
				
				TasteScoreView(type: .mini,
							   sweetness: makHoly.taste?.makTasteSweet ?? -1,
							   sourness: makHoly.taste?.makTasteSour ?? -1,
							   thickness: makHoly.taste?.makTasteThick ?? -1,
							   freshness: makHoly.taste?.makTasteFresh ?? -1)
			}
		}
		.frame(height: 80)
		.padding(.vertical, 10)
	}
}

private extension SearchResultSingleView {
	func imageView() -> some View {
		ZStack {
			RoundedRectangle(cornerRadius: 13)
				.foregroundColor(Color(uiColor: .designSystem(.darkgrey)!))
				.frame(width: 60, height: 80)
			MakHolyImageView(imageId: makHoly.makImageNumber ?? "-1", type: .mini)
		}
	}
	
	func descriptionView() -> some View {
		VStack(alignment: .leading, spacing: 0) {
			Text(makHoly.makName ?? "")
				.multilineTextAlignment(.leading)
				.lineLimit(2)
				.font(.style(.SF14R))
				.foregroundColor(Color(uiColor: .designSystem(.white)!))
				.padding(.bottom, 4)
			Text(BasicInfo.formattedSet(adv: makHoly.mainDetail?.makAlcoholPercentage ?? 0.0,
										volume: makHoly.mainDetail?.makVolume ?? 0,
										price: makHoly.mainDetail?.makPrice ?? 0))
			.font(.style(.SF10B))
			.foregroundColor(Color(uiColor: .designSystem(.white)!))
			.opacity(0.5)
		}
	}
}
