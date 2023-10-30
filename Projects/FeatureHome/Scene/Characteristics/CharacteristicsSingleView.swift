//
//  CharacteristicsSingleView.swift
//  FeatureMain
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CharacteristicsSingleView: View {
	let title: String
	let image: UIImage
	
	var body: some View {
		
		RoundedRectangle(cornerRadius: 10)
			.frame(height: 43)
			.overlay {
				HStack {
					Image(uiImage: image)
						.resizable()
						.aspectRatio(contentMode: .fit)
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
