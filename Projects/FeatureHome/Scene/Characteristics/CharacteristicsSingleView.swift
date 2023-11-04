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
		VStack {
			Image(uiImage: image)
				.resizable()
				.frame(width: 70, height: 70)
			Text(title)
				.font(.style(.SF12B))
				.foregroundColor(Color(uiColor: .designSystem(.w85)!))
		}
	}
}
