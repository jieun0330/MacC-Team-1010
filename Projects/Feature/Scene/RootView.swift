//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/03.
//

import SwiftUI
import Core
import DesignSystem
import FeatureEncyclopedia
import FeatureHome
import FeatureProfile
import FeatureSearch

public struct RootView: View {
	public init() {
		setCustomNavigationBar()
	}
	
	public var body: some View {
        TabView {
			HomeView()
				.tabItem {
					Image(uiImage: .designSystem(.home)!)
					Text("홈")
						.font(.style(.SF10B))
				}
			SearchView()
				.tabItem {
					Image(uiImage: .designSystem(.search)!)
					Text("검색")
						.font(.style(.SF10B))
				}
            TabMenuView()
				.tabItem {
					Image(uiImage: .designSystem(.heart)!)
					Text("내 막걸리")
						.font(.style(.SF10B))
				}
			ProfileView()
				.tabItem {
					Image(uiImage: .designSystem(.person)!)
					Text("내 정보")
						.font(.style(.SF10B))
				}
		}
	}
}
