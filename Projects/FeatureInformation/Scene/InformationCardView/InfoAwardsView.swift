//
//  InfoAwardsView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 2023/11/01.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct InfoAwardsView: View {
	let awards: [Award]
	
	var count: Int {
		return awards.count
	}
	
	let spacing: CGFloat = 16
	var width: CGFloat {
		switch count {
		case 1:
			return UIScreen.main.bounds.width - 32
		case 2:
			return (UIScreen.main.bounds.width - 32 - spacing) / 2
		case 3:
			return (UIScreen.main.bounds.width - 32 - 2 * spacing) / 3
		default:
			return 100
		}
	}
	
	var isScrollEnabled: Bool {
		if count < 4 {
			return false
		} else {
			return true
		}
	}
	
	var body: some View {
		VStack(spacing: 0){
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: spacing) {
					Rectangle()
						.frame(width: 0, height: 0)
					
					ForEach(awards) { award in
						HStack(spacing: 0) {
							infoAwardsSingleView(award: award)
							if award != awards.last {
								Divider()
									.foregroundColor(.W25)
									.frame(width: 0.33, height: 42)
							}
						}
					}
					
				}
			}
			.scrollDisabled(!isScrollEnabled)
			
			DividerView()
				.padding(.horizontal, 16)
		}
		
	}
}

extension InfoAwardsView {
	@ViewBuilder
	func infoAwardsSingleView(award: Award) -> some View {
		VStack(alignment: .leading, spacing: 0) {
			Text(String(award.year))
				.SF12R()
				.foregroundColor(.W50)
				.frame(maxWidth: self.width, alignment: .leading)
			Text(award.name)
				.SF12R()
				.foregroundColor(.W50)
				.frame(maxWidth: self.width, alignment: .leading)
				.padding(.bottom, 2)
			Text(award.type)
				.SF17R()
				.foregroundColor(.W85)
				.frame(maxWidth: self.width, alignment: .leading)
		}
		.frame(width: self.width)
		.padding(.vertical, 24)
	}
	
}
