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
	var body: some View {
		RoundedRectangle(cornerRadius: 12)
			.fill(Color(uiColor: .designSystem(.darkgrey)!))
			.frame(width: 130, height: 244)
			.overlay {
				VStack {
					Rectangle()
						.fill(Color(uiColor: .designSystem(.goldenyellow)!))
					
					Text("하늘달6 생막걸리")
						.font(.style(.SF12R))
					
					TasteGraphView(steps: 3)
						.frame(height: 4)
					TasteGraphView(steps: 1)
						.frame(height: 4)
					TasteGraphView(steps: 5)
						.frame(height: 4)
					TasteGraphView(steps: 2)
						.frame(height: 4)
				}
				.padding(.vertical, 12)
				.padding(.horizontal, 8)
			}
	}
}

private extension NewItemSingleView {
	@ViewBuilder
	func TasteGraphView(steps: Int) -> some View {
		HStack(spacing: 0) {
			ForEach(1...5, id: \.self) { step in
				Rectangle()
					.foregroundColor(step <= steps ? .blue : .clear)
			}
		}
	}
}
