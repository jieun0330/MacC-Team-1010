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
					.frame(height: 1)
					.background(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
					.padding(.vertical, 20)
				
				RegionView()
				
				Divider()
					.frame(height: 1)
					.background(Color(uiColor: .designSystem(.tempDarkGrayColor)!))
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
