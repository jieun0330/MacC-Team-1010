//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/06.
//

import SwiftUI
import Core
import DesignSystem

public struct MainView: View {
	@Environment(\.isSearching) private var isSearching
	
	public init() {}
	
	public var body: some View {
		ScrollView(showsIndicators: false) {
			VStack(spacing: 0) {
				Spacer()
					.frame(height: 12)
				
				CharacteristicsView()
				
				Divider()
					.background(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
					.frame(height: 1)
					.padding(.vertical, 20)
				
				RegionView()
				
				Divider()
					.background(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
					.frame(height: 1)
					.padding(.vertical, 20)
				
				PriceView()
				
				Spacer()
			}
		}
		.background(Color(uiColor: .designSystem(.bgColor)!))
		.opacity(isSearching ? 0 : 1)
		.animation(.easeIn, value: isSearching)
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
