//
//  MakgeolliInformationSignleView.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem
import FeatureInformation

struct MakgeolliInfoSingleView: View {
	@ObservedObject var viewModel: CategoryViewModel
	let makHoly: MakContent
	
	var body: some View {
		Button {
			if let id = makHoly.makSeq {
				viewModel.resultMakHolyId = id
			}
		} label: {
			VStack(alignment: .leading, spacing: 0) {
				RoundedRectangle(cornerRadius: 12)
					.fill(Color(uiColor: .designSystem(.darkgrey)!))
					.frame(height: 320)
					.overlay {
						VStack(spacing: 0) {
							MakHolyImageView(imageId: makHoly.makImageNumber!, type: .middle)
								.padding(.bottom, 16)
							
							Text(makHoly.makName ?? "")
								.foregroundColor(.White)
								.lineLimit(1)
								.font(.style(.SF12R))
								.padding(.horizontal, 16)
							
							Text(BasicInfo.formattedSet(adv: makHoly.makAlcoholPercentage ?? 0.0,
														volume: makHoly.makVolume ?? 0,
														price: makHoly.makPrice ?? 0))
							.padding(.top, 2)
							.font(.style(.SF10R))
							.foregroundColor(Color(uiColor: .designSystem(.w50)!))
							.padding(.top, 2)
							
							TasteScoreView(type: .mini,
										   sweetness: Int(makHoly.makTasteSweet ?? -1.0),
										   sourness: Int(makHoly.makTasteSour ?? -1.0),
										   thickness: Int(makHoly.makTasteThick ?? -1.0),
										   freshness: Int(makHoly.makTasteFresh ?? -1.0))
							.padding(.top, 16)
						}
						.padding(.vertical, 32)
					}
			}
		}
	}
}
