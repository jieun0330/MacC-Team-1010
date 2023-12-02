//
//  NewItemSingleView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct NewItemSingleView: View {
	@ObservedObject var viewModel: HomeViewModel
	
	let item: NewMakListMakgeolliDetail
	
	var body: some View {
		Button {
			if let id = item.makNumber {
				viewModel.resultMakHolyId = id
			}
		} label: {
			Rectangle()
				.foregroundColor(.clear)
				.frame(width: 104, height: 240)
				.background(Color(uiColor: .designSystem(.darkgrey)!))
				.cornerRadius(18)
				.overlay(
					RoundedRectangle(cornerRadius: 18)
						.fill(Color.DarkGrey)
						.overlay {
							VStack {
								MakHolyImageView(imageId: item.makImageNumber ?? "-1",
												 type: .small)
								.padding(.top, 5)
								
								Spacer()
									.frame(height: 12)
								
								Text(item.makName!)
									.foregroundColor(.White)
									.font(.style(.SF12R))
									.lineLimit(1)
									.padding(.horizontal, 8)
								
								Spacer()
									.frame(height: 12)
								
								TasteGraphView(scores: [item.taste.makTasteSweet ?? -1.0,
														item.taste.makTasteSour ?? -1.0,
														item.taste.makTasteThick ?? -1.0,
														item.taste.makTasteFresh ?? -1.0])
								.padding(.horizontal, 20)
							}
							.padding(.vertical, 16)
						}
				)
		}
	}
}
