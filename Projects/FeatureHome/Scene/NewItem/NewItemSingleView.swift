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
	let item: NewMakListMakgeolliDetail
	
	var body: some View {
		NavigationLink {
			// 막걸리 상세 뷰로 이동
		} label: {
			Rectangle()
				.foregroundColor(.clear)
				.frame(width: 110, height: 230)
				.cornerRadius(18)
				.overlay(
					RoundedRectangle(cornerRadius: 18)
						.inset(by: 1.5)
						.stroke(
							LinearGradient(
								stops: [
									Gradient.Stop(color: Color(red: 0.18, green: 0.18, blue: 0.39),
												  location: 0.00),
									Gradient.Stop(color: Color(red: 0.71, green: 0.66, blue: 0.48),
												  location: 1.00)
								],
								startPoint: UnitPoint(x: 0.5, y: 0),
								endPoint: UnitPoint(x: 0.5, y: 1)
							), lineWidth: 3)
						.overlay {
							VStack {
								MakHolyImageView(imageId: item.makImageNumber ?? "-1",
												 type: .middle)
								
								Spacer()
									.frame(height: 12)
								
								Text(item.makName!)
									.font(.style(.SF12R))
									.lineLimit(1)
								
								Spacer()
									.frame(height: 12)
								
								TasteGraphView(scores: [item.taste?.makTasteSweet ?? -1,
														item.taste?.makTasteSour ?? -1,
														item.taste?.makTasteThick ?? -1,
														item.taste?.makTasteFresh ?? -1])
							}
							.padding(.vertical, 12)
							.padding(.horizontal, 8)
						}
				)
		}
	}
}
