//
//  RegionSingleView.swift
//  FeatureCategory
//
//  Created by Kim SungHun on 2023/10/19.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct RegionSingleView: View {
	let regionType: RegionType
	
	var body: some View {
		Image(uiImage: regionType.regionImage)
			.resizable()
			.frame(height: 178)
			.aspectRatio(contentMode: .fit)
			.cornerRadius(10)
			.overlay {
				VStack {
					Spacer()
					Rectangle()
						.fill(.black.opacity(0.7))
						.padding(.top, 10.0)
						.cornerRadius(9.0)
						.padding(.top, -10.0)
						.frame(height: 48)
						.overlay {
							HStack {
								Spacer()
									.frame(width: 16)
								Text(regionType.rawValue)
									.font(.system(size: 20, weight: .regular))
									.foregroundColor(.white)
								Spacer()
							}
						}
				}
			}
	}
}
