//
//  CharacteristicsSignleView.swift
//  FeatureMain
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CharacteristicsSignleView: View {
	
	let title: String
	let color: UIColor
	
	var body: some View {
		RoundedRectangle(cornerRadius: 10)
			.fill(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
			.frame(height: 43)
			.overlay {
				HStack {
					Rectangle()
						.fill(Color(uiColor: color))
						.padding(.trailing, 10.0)
						.cornerRadius(9.0)
						.padding(.trailing, -10.0)
						.frame(width: 43, height: 43)
					Text(title)
						.font(.system(size: 16, weight: .regular))
						.foregroundColor(.white)
					Spacer()
				}
			}
	}
}
