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
	let item: MakHolyMini
	
	var body: some View {
		NavigationLink {
			// 막걸리 상세 뷰로 이동
		} label: {
			RoundedRectangle(cornerRadius: 12)
				.fill(Color(uiColor: .designSystem(.darkgrey)!))
				.frame(width: 130, height: 244)
				.overlay {
					VStack {
						Rectangle()
							.fill(Color(uiColor: .designSystem(.goldenyellow)!))
						
						Text(item.name)
							.font(.style(.SF12R))
							.lineLimit(1)
						
						TasteGraphView(steps: Int(item.sweetness))
							.frame(height: 4)
						TasteGraphView(steps: Int(item.sourness))
							.frame(height: 4)
						TasteGraphView(steps: Int(item.thickness))
							.frame(height: 4)
						TasteGraphView(steps: Int(item.freshness))
							.frame(height: 4)
					}
					.padding(.vertical, 12)
					.padding(.horizontal, 8)
				}
		}
	}
}

private extension NewItemSingleView {
	@ViewBuilder
	func TasteGraphView(steps: Int) -> some View {
		HStack(spacing: 0) {
			ForEach(1...5, id: \.self) { step in
				Rectangle()
					.foregroundColor(
						step <= steps ? Color(uiColor: .designSystem(.primary)!)
						: Color(uiColor: .designSystem(.w10)!)
					)
			}
		}
	}
}
