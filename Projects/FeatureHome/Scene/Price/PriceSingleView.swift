//
//  PriceSingleView.swift
//  FeatureMain
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct PriceSingleView: View {
	let title: String
	
	var body: some View {
		RoundedRectangle(cornerRadius: 10)
			.fill(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
			.frame(height: 43)
			.overlay {
				HStack {
					Spacer()
						.frame(width: 16)
					Text(title)
						.font(.system(size: 16, weight: .regular))
						.foregroundColor(.white)
					Spacer()
				}
			}
	}
}
