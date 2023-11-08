//
//  InfoImageView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/8/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct InfoImageView: View {
	let imageId: String
	
    var body: some View {
		VStack(spacing: 0) {
			ZStack {
				VStack {
					Circle()
						.fill(
							LinearGradient(
								stops: [
									Gradient.Stop(color: .NightSkyTop, location: 0.00),
									Gradient.Stop(color: .NightSkyBottom, location: 1.00),
								],
								startPoint: UnitPoint(x: 0.45, y: 0),
								endPoint: UnitPoint(x: 0.45, y: 1)
							)
						)
						.frame(width: 234, height: 234)
					Spacer()
				}
				VStack {
					Spacer()
					MakHolyImageView(imageId: imageId, type: .large)
				}
			}
		}
    }
}
