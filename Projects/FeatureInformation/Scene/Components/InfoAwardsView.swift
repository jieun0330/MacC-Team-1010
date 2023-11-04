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
	
	var awards: [Award] = Award.mockDatas
	var count: Int {
		return awards.count
	}
	
	var width: CGFloat {
		switch count {
		case 1:
			return UIScreen.main.bounds.width - 32
		case 2:
			return (UIScreen.main.bounds.width - 32) / 2
		case 3:
			return (UIScreen.main.bounds.width - 32) / 3
		default:
			return 120
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
		
		if count > 0 {
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 0) {
					ForEach(awards, id: \.self) { award in
						infoAwardsSingleView(award: award)
						if award != awards.last {
							Divider()
								.background(Color(uiColor: .designSystem(.w25)!))
								.frame(width: 0.33, height: 42)
						}
					}
				}
			}
			.scrollDisabled(!isScrollEnabled)
		}
	}
}

extension InfoAwardsView {
	
	@ViewBuilder
	func infoAwardsSingleView(award: Award) -> some View {
		VStack(alignment: .center, spacing: 1) {
			Text(String(award.year))
				.font(.style(.SF12R))
				.foregroundColor(Color(uiColor: .designSystem(.w50)!))
			Text(award.name)
				.font(.style(.SF12R))
				.foregroundColor(Color(uiColor: .designSystem(.w75)!))
			Text(award.type)
				.font(.style(.SF17R))
				.foregroundColor(Color(uiColor: .designSystem(.w75)!))
		}
		.frame(width: self.width)
		.padding(.vertical, 24)
	}
	
	
}

struct InfoAwardsView_Previews: PreviewProvider {
	static var previews: some View {
		HStack {
			InfoAwardsView()
		}
		.padding(.horizontal, 16)
	}
}
