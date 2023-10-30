//
//  RegionSingleView.swift
//  FeatureMain
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct RegionSingleView: View {
	let regionType: RegionType
	
	var body: some View {
		Image(uiImage: .designSystem(.mockMakgeolli)!)
			.resizable()
			.frame(width: 150, height: 150)
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
						.frame(width: 150, height: 43)
						.overlay {
							HStack {
								Spacer()
									.frame(width: 16)
								Text(regionType.rawValue)
									.font(.system(size: 16, weight: .regular))
									.foregroundColor(.white)
								Spacer()
							}
						}
				}
			}
	}
}
