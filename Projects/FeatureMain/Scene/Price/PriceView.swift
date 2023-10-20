//
//  PriceView.swift
//  FeatureMain
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import FeatureCategoryList

struct PriceView: View {
	private let priceGroup = stride(from: 0,
									to: PriceType.allCases.count,
									by: 2).map { startIndex in
		Array(PriceType.allCases[
			startIndex..<min(startIndex + 2, PriceType.allCases.count)
		])
	}
	
	var body: some View {
		VStack {
			HStack(spacing: 0) {
				Text("가격대별")
					.font(.system(size: 18, weight: .bold))
					.foregroundColor(.white)
				Text("로 찾기")
					.font(.system(size: 18, weight: .regular))
					.foregroundColor(.white)
				Spacer()
				Image(systemName: "chevron.right")
			}
			Spacer()
				.frame(height: 16)
			ScrollView(.horizontal, showsIndicators: false) {
				ForEach(priceGroup, id: \.self) { prices in
					HStack {
						ForEach(prices, id: \.self) { price in
							NavigationLink {
								CategoryListView()
							} label: {
								PriceSingleView(title: price.description)
									.frame(width: 200)
							}
						}
					}
				}
			}
		}
		.padding(.leading, 16)
	}
}

struct PriceView_Previews: PreviewProvider {
	static var previews: some View {
		PriceView()
	}
}
